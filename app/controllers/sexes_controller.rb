class SexesController < ApplicationController
  # GET /sexes
  # GET /sexes.xml
  def index
    @sexes = Sex.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sexes }
    end
  end

  # GET /sexes/1
  # GET /sexes/1.xml
  def show
    @sex = Sex.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sex }
    end
  end

  # GET /sexes/new
  # GET /sexes/new.xml
  def new
    @sex = Sex.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sex }
    end
  end

  # GET /sexes/1/edit
  def edit
    @sex = Sex.find(params[:id])
  end

  # POST /sexes
  # POST /sexes.xml
  def create
    @sex = Sex.new(params[:sex])

    respond_to do |format|
      if @sex.save
        format.html { redirect_to(@sex, :notice => 'Sex was successfully created.') }
        format.xml  { render :xml => @sex, :status => :created, :location => @sex }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sex.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sexes/1
  # PUT /sexes/1.xml
  def update
    @sex = Sex.find(params[:id])

    respond_to do |format|
      if @sex.update_attributes(params[:sex])
        format.html { redirect_to(@sex, :notice => 'Sex was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sex.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sexes/1
  # DELETE /sexes/1.xml
  def destroy
    @sex = Sex.find(params[:id])
    @sex.destroy

    respond_to do |format|
      format.html { redirect_to(sexes_url) }
      format.xml  { head :ok }
    end
  end
end
