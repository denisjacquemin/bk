require 'prawn/layout' 

page_number_y = [pdf.bounds.right-30, pdf.bounds.bottom + 12]
page_counter = pdf.lazy_bounding_box(page_number_y, :width => 50) do   
     pdf.text "#{t('assur.pdf.Page')}: #{pdf.page_count}", :size => 8
end

pdf.repeat :all do
  # header
  pdf.bounding_box [pdf.bounds.left, pdf.bounds.top], :width  => pdf.bounds.width  do
      pdf.font "Helvetica"
      pdf.text current_user.company.name, :align => :left, :size => 20 unless current_user.company.name.nil?
      pdf.text current_user.company.slogan, :size => 10, :style => :italic unless current_user.company.slogan.nil?
      pdf.move_down(5)
      pdf.text "#{current_user.company.address.number}, #{current_user.company.address.street}", :size => 10
      pdf.text "#{current_user.company.address.zipcode}, #{current_user.company.address.city}", :size => 10
      pdf.text "Tel: 061/61.25.99", :size => 10
      pdf.text "Fax: 061/61.25.99", :size => 10
      pdf.text "GSM: 0461/61.25.99", :size => 10
      pdf.move_down(15)
      pdf.text "#{t('assur.pdf.Bill_reference')}: #{@bill.reference}", :align => :left, :size => 10
      pdf.text "#{t('assur.pdf.Customer_reference')}: #{@bill.customer.reference}", :align => :left, :size => 10 unless @bill.customer.nil?
      
  end
  pdf.bounding_box [pdf.bounds.left, pdf.bounds.top], :width  => pdf.bounds.width do
      pdf.fill_color "AAAAAA"
      pdf.font "Helvetica"
      pdf.text t('assur.pdf.Bill'), :align => :right, :size => 30, :style => :bold
      pdf.move_down(10)
      pdf.fill_color "000000"
      pdf.text "#{t('assur.pdf.Date')}: #{l @bill.effective_date}", :align => :right, :size => 15
      pdf.move_down(10)
      
      
  end
  
  # Customer Address
  pdf.bounding_box [pdf.bounds.left, pdf.bounds.top - 100], :width  => pdf.bounds.width - 70 do
    unless @bill.customer.nil?
      pdf.text "#{@bill.customer_firstname} #{@bill.customer_lastname}", :size => 12, :align => :right
      unless @bill.customer.address.nil?
        pdf.text "#{@bill.customer.address.number}, #{@bill.customer.address.street}", :size => 12, :align => :right
        pdf.text "#{@bill.customer.address.zipcode} #{@bill.customer.address.city}", :size => 12, :align => :right
      end
    end
  end
 
  # footer
  pdf.bounding_box [pdf.bounds.left, pdf.bounds.bottom + 25], :width  => pdf.bounds.width do
      pdf.font "Helvetica"
      pdf.stroke_horizontal_rule
      pdf.move_down(3)
      pdf.text "#{current_user.company.name unless current_user.company.name.nil?} | TVA #{current_user.company.tva_number unless current_user.company.tva_number.nil?} | NE: #{current_user.company.enreg_number unless current_user.company.enreg_number.nil?} | ING 310-1541386-45 | Fortis 210-0983261-24  | KBC 210-0983261-24", :align => :center, :size => 8
  end
  page_counter.draw
end

pdf.bounding_box([pdf.bounds.left, pdf.bounds.top - 180], :width  => pdf.bounds.width, :height => pdf.bounds.height - 300) do                 
   
   pdf.text @bill.name, :size => 12
   pdf.move_down(10)
   
   items = @bill.products.map do |item|
       [
           item.name,
           item.totalhtva,
           item.totaltvac
       ]
   end
   
   pdf.table items, :border_style => :grid,
       :row_colors         => :pdf_writer,
       :headers => [t('assur.pdf.header_product_description'), t('assur.pdf.header_htva'), t('assur.pdf.header_tvac')], 
       :align => { 0 => :left, 1 => :right, 2 => :right},
       :column_widths => { 0 => 410, 1 => 65, 2 => 65}
  
   pdf.move_down(10)  
   pdf.text "#{t('assur.pdf.Total_htva')} #{@bill.totalhtva}", :size => 10, :align => :right
   pdf.move_down(5)
   pdf.text "#{t('assur.pdf.Total_tvac')} #{@bill.totaltvac}", :size => 13, :align => :right
   
end


#page_number_y = [pdf.bounds.right-50, pdf.bounds.bottom + 25]

#
#  pdf.text "Nom de societe", :size => 20
#  pdf.text "Slogan de la societe", :size => 12, :style => :italic
#
#  pdf.text "#{@bill.customer_firstname} #{@bill.customer_lastname}"
#  pdf.text "#{@bill.customer.address.number}, #{@bill.customer.address.street}"
#  pdf.text "#{@bill.customer.address.zipcode} #{@bill.customer.address.city}"
#  
#  pdf.move_down(30)
#  
#  pdf.text "#{t('assur.pdf.Customer_reference')}: #{@bill.customer.reference}", :size => 10
#  pdf.text "#{t('assur.pdf.Bill_reference')}: #{@bill.reference}", :size => 10
#  
#  pdf.move_down(20)
#  
#  pdf.text "#{t('assur.pdf.Bill')}: #{@bill.name}", :size => 20
#  
#  #pdf.text pdf.methods.to_s
#  
#  
#  #for item in items do
#    #pdf.text "#{item[0]} - #{item[1]} - #{item[2]} - #{item[3]}"
#    #pdf.move_down(10)
#  #end
#  
#  
#  
#  pdf.bounding_box(page_number_y, :width => 100, :height => 50) do
#    pdf.text "Page #{pdf.page_number}"
#  end
#
#
#
#pdf.table items, :border_style => :grid,
#    :row_colors => ["ffffff", "dddddd"],
#    :headers => [t('assur.pdf.header_product_description'), t('assur.pdf.header_quantity'), t('assur.pdf.header_unit_price'), t('assur.pdf.header_tva')], 
#    :align => { 0 => :left, 1 => :right, 2 => :right, 3 => :right }
#
##point = [pdf.bounds.right-50, pdf.bounds.bottom + 25]
##page_counter = pdf.lazy_bounding_box(point, :width => 50) do   
##     pdf.text "Page: #{pdf.page_count}"
##end 
##page_counter.draw


