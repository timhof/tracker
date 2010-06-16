class BugStatusesController < ApplicationController
  # GET /bug_statuses
  # GET /bug_statuses.xml
  def index
    @bug_statuses = BugStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bug_statuses }
    end
  end

  # GET /bug_statuses/new
  # GET /bug_statuses/new.xml
  def new
    @bug_status = BugStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bug_status }
    end
  end

  # GET /bug_statuses/1/edit
  def edit
    @bug_status = BugStatus.find(params[:id])
  end

  # POST /bug_statuses
  # POST /bug_statuses.xml
  def create
    @bug_status = BugStatus.new(params[:bug_status])

    respond_to do |format|
      if @bug_status.save
        flash[:notice] = 'BugStatus was successfully created.'
      	format.html { redirect_to(bug_statuses_url) }
        format.xml  { render :xml => @bug_status, :status => :created, :location => @bug_status }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bug_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bug_statuses/1
  # PUT /bug_statuses/1.xml
  def update
    @bug_status = BugStatus.find(params[:id])

    respond_to do |format|
      if @bug_status.update_attributes(params[:bug_status])
        flash[:notice] = 'BugStatus was successfully updated.'
      	format.html { redirect_to(bug_statuses_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bug_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bug_statuses/1
  # DELETE /bug_statuses/1.xml
  def destroy
    @bug_status = BugStatus.find(params[:id])
    @bug_status.destroy

    respond_to do |format|
      format.html { redirect_to(bug_statuses_url) }
      format.xml  { head :ok }
    end
  end
end
