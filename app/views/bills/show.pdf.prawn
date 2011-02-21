require 'prawn/layout'

company = @bill.author.company



pdf.repeat :all do
  # header
  pdf.bounding_box [pdf.bounds.left, pdf.bounds.top], :width  => pdf.bounds.width  do
      pdf.font "Helvetica"
      pdf.text company.name, :align => :left, :size => 20 unless company.name.nil?
      pdf.text company.slogan, :size => 10, :style => :italic unless company.slogan.nil?
      pdf.move_down(5)
      pdf.text "#{company.address.number}, #{company.address.street}", :size => 10
      pdf.text "#{company.address.zipcode}, #{company.address.city}", :size => 10
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
      footer = "#{company.name unless company.name.nil?} | TVA #{company.tva_number unless company.tva_number.nil?} | NE: #{company.enreg_number unless company.enreg_number.nil?} "
      for bankaccount in @bill.author.company.bankaccounts do
        footer = footer + "| #{bankaccount.name} "
      end
      pdf.text footer, :align => :center, :size => 8
  end
  
  pdf.font_size(8) {
    pdf.number_pages "<page>/<total>", [pdf.bounds.right-10, pdf.bounds.bottom + 5]
  }
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
       :row_colors => :pdf_writer,
       :headers => [t('assur.pdf.header_product_description'), t('assur.pdf.header_htva'), t('assur.pdf.header_tvac')], 
       :align => { 0 => :left, 1 => :right, 2 => :right},
       :column_widths => { 0 => 400, 1 => 70, 2 => 70}
end

pdf.move_down(10)  
pdf.text "#{t('assur.pdf.Total_htva')} #{@bill.totalhtva}", :size => 10, :align => :right
pdf.move_down(5)
pdf.text "#{t('assur.pdf.Total_tvac')} #{@bill.totaltvac}", :size => 13, :align => :right

pdf.bounding_box [pdf.bounds.left, pdf.bounds.bottom + 70], :width  => pdf.bounds.width do
    pdf.font "Helvetica"
    pdf.text @bill.note, :size => 8
end