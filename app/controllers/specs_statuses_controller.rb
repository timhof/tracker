class SpecsStatusesController < ApplicationController
  # GET /specs_statuses
  # GET /specs_statuses.xml
  def index
    @specs_statuses = SpecsStatus.find(:all, :order => "rank asc")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @specs_statuses }
    end
  end

  # GET /specs_statuses/new
  # GET /specs_statuses/new.xml
  def new
    @specs_status = SpecsStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @specs_status }
    end
  end

  # GET /specs_statuses/1/edit
  def edit
    @specs_status = SpecsStatus.find(params[:id])
  end

  # POST /specs_statuses
  # POST /specs_statuses.xml
  def create
    @specs_status = SpecsStatus.new(params[:specs_status])

    respond_to do |format|
      if @specs_status.save
        flash[:notice] = 'SpecsStatus was successfully created.'
      format.html { redirect_to(specs_statuses_url) }
        format.xml  { render :xml => @specs_status, :status => :created, :location => @specs_status }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @specs_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /specs_statuses/1
  # PUT /specs_statuses/1.xml
  def update
    @specs_status = SpecsStatus.find(params[:id])

    respond_to do |format|
      if @specs_status.update_attributes(params[:specs_status])
        flash[:notice] = 'SpecsStatus was successfully updated.'
      format.html { redirect_to(specs_statuses_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @specs_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /specs_statuses/1
  # DELETE /specs_statuses/1.xml
  def destroy
    @specs_status = SpecsStatus.find(params[:id])
    @specs_status.destroy

    respond_to do |format|
      format.html { redirect_to(specs_statuses_url) }
      format.xml  { head :ok }
    end
  end
end
