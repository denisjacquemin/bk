class BillsController < ApplicationController
  # GET /bills
  # GET /bills.xml
  def index
    @bills = Bill.by_company(current_user.company_id)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bills }
    end
  end

  # GET /bills/1
  # GET /bills/1.xml
  def show
    @bill = Bill.find(params[:id])
    
    # set filename :format => fct_Cutomer-fullname_bill-reference_bill-effective-date.pdf
    prawnto :filename => "fct_#{@bill.customer_fullname_with_underscore}_#{@bill.reference}_#{@bill.effective_date}.pdf"

    respond_to do |format|
      #format.pdf { render :action => "show", :format => :pdf, :options => {:filename => 'toto.pdf'} }
      format.pdf
    end
  end

  # GET /bills/new
  # GET /bills/new.xml
  def new
    @bill = Bill.new
    @bill.products.build
    @bill.reference = 'B' + (Bill.all.count + 1).to_s

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bill }
    end
  end

  # GET /bills/1/edit
  def edit
    @bill = Bill.find(params[:id])
  end

  # POST /bills
  # POST /bills.xml
  def create
    @bill = Bill.new(params[:bill])
    @bill.author_id = current_user.id
    @bill.company_id = current_user.company_id

    respond_to do |format|
      if @bill.save
        format.html { redirect_to edit_bill_url(@bill), :notice => "#{t('assur.bill.Successfully_created')}." }
        format.xml  { render :xml => @bill, :status => :created, :location => @bill }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bill.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bills/1
  # PUT /bills/1.xml
  def update
    @bill = Bill.find(params[:id]) 

    respond_to do |format|
      if @bill.update_attributes(params[:bill])
        format.html { redirect_to edit_bill_url(@bill), :notice => "#{t('assur.bill.Successfully_updated')}." }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bill.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.xml
  def destroy
    @bill = Bill.find(params[:id])
    @bill.destroy

    respond_to do |format|
      format.html { redirect_to(bills_url) }
      format.xml  { head :ok }
    end
  end
end
