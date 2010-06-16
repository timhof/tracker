class UsageStatusesController < ApplicationController
  # GET /usage_statuses
  # GET /usage_statuses.xml
  def index
    @usage_statuses = UsageStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @usage_statuses }
    end
  end

  # GET /usage_statuses/1
  # GET /usage_statuses/1.xml
  def show
    @usage_status = UsageStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @usage_status }
    end
  end

  # GET /usage_statuses/new
  # GET /usage_statuses/new.xml
  def new
    @usage_status = UsageStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @usage_status }
    end
  end

  # GET /usage_statuses/1/edit
  def edit
    @usage_status = UsageStatus.find(params[:id])
  end

  # POST /usage_statuses
  # POST /usage_statuses.xml
  def create
    @usage_status = UsageStatus.new(params[:usage_status])

    respond_to do |format|
      if @usage_status.save
        flash[:notice] = 'UsageStatus was successfully created.'
      format.html { redirect_to(usage_statuses_url) }
        format.xml  { render :xml => @usage_status, :status => :created, :location => @usage_status }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @usage_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /usage_statuses/1
  # PUT /usage_statuses/1.xml
  def update
    @usage_status = UsageStatus.find(params[:id])

    respond_to do |format|
      if @usage_status.update_attributes(params[:usage_status])
        flash[:notice] = 'UsageStatus was successfully updated.'
      format.html { redirect_to(usage_statuses_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @usage_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /usage_statuses/1
  # DELETE /usage_statuses/1.xml
  def destroy
    @usage_status = UsageStatus.find(params[:id])
    @usage_status.destroy

    respond_to do |format|
      format.html { redirect_to(usage_statuses_url) }
      format.xml  { head :ok }
    end
  end
end
