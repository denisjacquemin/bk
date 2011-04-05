class CustomersController < ApplicationController
  load_and_authorize_resource
  
  # GET /customers
  # GET /customers.xml
  def index
    @customers = Customer.by_company(current_user.company_id).active.latest

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @customers }
    end
  end

  # GET /customers/1
  # GET /customers/1.xml
  def show
    @customer = Customer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @customer }
    end
  end

  # GET /customers/new
  # GET /customers/new.xml
  def new
    @customer = Customer.new
    @customer.build_address
    @customer.address.build_country
    @customer.build_sex
    @customer.build_language
    @customer.build_nationality
    @customer.build_title
    
    lastid = 1
    if Customer.by_company(current_user.company_id).size > 0
      lastid = Customer.by_company(current_user.company_id).maximum('id')
    end

    @customer.reference = 'C-' + current_user.company_id.to_s + (lastid + 1).to_s

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @customer }
    end
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
  end

  # POST /customers
  # POST /customers.xml
  def create
    @customer = Customer.new(params[:customer])
    @customer.company_id = current_user.company_id
    respond_to do |format|
      if @customer.save
        format.html { redirect_to edit_customer_url(@customer), :notice => "#{t('assur.customer.successfully_created')}." }
        format.xml  { render :xml => @customer, :status => :created, :location => @customer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /customers/1
  # PUT /customers/1.xml
  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to edit_customer_url(@customer), :notice => "#{t('assur.customer.successfully_updated')}." }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.xml
  def destroy
    @customer = Customer.find(params[:id])
    @customer.deleted = 1
    @customer.save

    respond_to do |format|
      format.html { redirect_to(customers_url) }
      format.xml  { head :ok }
    end
  end
  
  def autocomplete
    
    customers = Customer.where("deleted = ? and company_id = ? and (firstname like ? or lastname like ? or reference like ?)", false, current_user.company_id, "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%")
    render :json => {
      :query => params[:query],
      :suggestions => customers.collect{ |c| c.fullname_with_reference },
      :data => customers.collect(&:id)
    }
    
  end
end
