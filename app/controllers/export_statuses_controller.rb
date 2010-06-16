class ExportStatusesController < ApplicationController
  # GET /export_statuses
  # GET /export_statuses.xml
  def index
    @export_statuses = ExportStatus.find(:all, :order => "rank asc")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @export_statuses }
    end
  end

  # GET /export_statuses/new
  # GET /export_statuses/new.xml
  def new
    @export_status = ExportStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @export_status }
    end
  end

  # GET /export_statuses/1/edit
  def edit
    @export_status = ExportStatus.find(params[:id])
  end

  # POST /export_statuses
  # POST /export_statuses.xml
  def create
    @export_status = ExportStatus.new(params[:export_status])

    respond_to do |format|
      if @export_status.save
        flash[:notice] = 'ExportStatus was successfully created.'
      format.html { redirect_to(export_statuses_url) }
        format.xml  { render :xml => @export_status, :status => :created, :location => @export_status }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @export_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /export_statuses/1
  # PUT /export_statuses/1.xml
  def update
    @export_status = ExportStatus.find(params[:id])

    respond_to do |format|
      if @export_status.update_attributes(params[:export_status])
        flash[:notice] = 'ExportStatus was successfully updated.'
      format.html { redirect_to(export_statuses_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @export_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /export_statuses/1
  # DELETE /export_statuses/1.xml
  def destroy
    @export_status = ExportStatus.find(params[:id])
    @export_status.destroy

    respond_to do |format|
      format.html { redirect_to(export_statuses_url) }
      format.xml  { head :ok }
    end
  end
end
