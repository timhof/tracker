class ReportStatusesController < ApplicationController
  # GET /report_statuses
  # GET /report_statuses.xml
  def index
    @report_statuses = ReportStatus.find(:all, :order => "rank asc")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @report_statuses }
    end
  end

  # GET /report_statuses/new
  # GET /report_statuses/new.xml
  def new
    @report_status = ReportStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @report_status }
    end
  end

  # GET /report_statuses/1/edit
  def edit
    @report_status = ReportStatus.find(params[:id])
  end

  # POST /report_statuses
  # POST /report_statuses.xml
  def create
    @report_status = ReportStatus.new(params[:report_status])

    respond_to do |format|
      if @report_status.save
        flash[:notice] = 'ReportStatus was successfully created.'
        format.html { redirect_to :action => "index" }
        format.xml  { render :xml => @report_status, :status => :created, :location => @report_status }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @report_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /report_statuses/1
  # PUT /report_statuses/1.xml
  def update
    @report_status = ReportStatus.find(params[:id])

    respond_to do |format|
      if @report_status.update_attributes(params[:report_status])
        flash[:notice] = 'ReportStatus was successfully updated.'
        format.html { redirect_to :action => "index" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @report_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /report_statuses/1
  # DELETE /report_statuses/1.xml
  def destroy
    @report_status = ReportStatus.find(params[:id])
    @report_status.destroy

    respond_to do |format|
      format.html { redirect_to(report_statuses_url) }
      format.xml  { head :ok }
    end
  end
end
