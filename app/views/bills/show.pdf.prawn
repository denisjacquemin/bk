require 'prawn/layout' 

page_number_y = [pdf.bounds.right-30, pdf.bounds.bottom + 12]
page_counter = pdf.lazy_bounding_box(page_number_y, :width => 50) do   
     pdf.text "Page: #{pdf.page_count}", :size => 8
end

pdf.repeat :all do
  # header
  pdf.bounding_box [pdf.bounds.left, pdf.bounds.top], :width  => pdf.bounds.width  do
      pdf.font "Helvetica"
      pdf.text "Nom Societe", :align => :left, :size => 20
      pdf.text "Slogan de la societe", :size => 10, :style => :italic
      pdf.move_down(10)
      pdf.text "11, nom de la rue", :size => 10
      pdf.text "6900, Marche en Famenne", :size => 10
      pdf.text "Tel: 061/61.25.99", :size => 10
      pdf.text "Fax: 061/61.25.99", :size => 10
      pdf.text "GSM: 0461/61.25.99", :size => 10
      pdf.move_down(15)
      unless @bill.customer.nil?
        pdf.text "Facture a: ", :size => 10, :style => :bold
        pdf.text "#{@bill.customer_firstname} #{@bill.customer_lastname}", :size => 10
        unless @bill.customer.address.nil?
          pdf.text "#{@bill.customer.address.number}, #{@bill.customer.address.street}", :size => 10
          pdf.text "#{@bill.customer.address.zipcode} #{@bill.customer.address.city}", :size => 10
        end
      end
      
      
  end
  pdf.bounding_box [pdf.bounds.left, pdf.bounds.top], :width  => pdf.bounds.width do
      pdf.fill_color "AAAAAA"
      pdf.font "Helvetica"
      pdf.text "Facture", :align => :right, :size => 30, :style => :bold
      pdf.move_down(10)
      pdf.fill_color "000000"
      pdf.text "Date: 12 Fevrier 2011", :align => :right, :size => 10
      pdf.text "Reference facture: f87870", :align => :right, :size => 10
      pdf.text "Reference client: c8778", :align => :right, :size => 10
  end
 
  # footer
  pdf.bounding_box [pdf.bounds.left, pdf.bounds.bottom + 25], :width  => pdf.bounds.width do
      pdf.font "Helvetica"
      pdf.stroke_horizontal_rule
      pdf.move_down(3)
      pdf.text "Nom Societe | TVA BE 0463.770.658 | NE: 11.15.11 | ING 310-1541386-45 | Fortis 210-0983261-24  | KBC 210-0983261-24", :align => :center, :size => 8
  end
  page_counter.draw
end

pdf.bounding_box([pdf.bounds.left, pdf.bounds.top - 180], :width  => pdf.bounds.width, :height => pdf.bounds.height - 300) do                 
   items = @bill.products.map do |item|
       [
           item.name,
           item.quantity,
           item.unit_price,
           item.tva.value
       ]
   end
   
   pdf.table items, :border_style => :grid,
       :row_colors         => :pdf_writer,
       :headers => [t('assur.pdf.header_product_description'), t('assur.pdf.header_quantity'), t('assur.pdf.header_unit_price'), t('assur.pdf.header_tva')], 
       :align => { 0 => :left, 1 => :right, 2 => :right, 3 => :right },
       :column_widths => { 0 => 345, 1 => 65, 2 => 65, 3 => 65 }
   
   
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


