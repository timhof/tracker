class BugsController < ApplicationController
  # GET /bugs
  # GET /bugs.xml
  def index
    @bugs = Bug.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bugs }
    end
  end

  # GET /bugs/1
  # GET /bugs/1.xml
  def show
    @bug = Bug.find(params[:id])
	@report = Report.find(params[:report_id])
	logger.info @bug.description
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bug }
    end
  end

  # GET /bugs/new
  # GET /bugs/new.xml
  def new
    @bug = Bug.new
	@report = Report.find(params[:report_id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bug }
    end
  end

  # GET /bugs/1/edit
  def edit
    @bug = Bug.find(params[:id])
	@report = Report.find(params[:report_id])
  end

  # POST /bugs
  # POST /bugs.xml
  def create
    @bug = Bug.new(params[:bug])
    @report = Report.find(params[:report_id])
    @bug.report = @report
    respond_to do |format|
      if params[:commit].eql?('Create') && @bug.save
          flash[:notice] = 'Bug was successfully created.'
      	  format.html { redirect_to([@report, @bug]) }
      elsif params[:commit].eql?('Create & Add') && @bug.save
          flash[:notice] = 'Bug was successfully created.'
      	  @bug = Bug.new
      	  format.html { render :action => "new" }
      elsif params[:commit].eql?('Cancel')
      	format.html { redirect_to(@report) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bug.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bugs/1
  # PUT /bugs/1.xml
  def update
    @bug = Bug.find(params[:id])
	@report = Report.find(params[:report_id])
    respond_to do |format|
      success = true
      if params[:commit].eql?('Update')
      	success = @bug.update_attributes(params[:bug])
      	flash[:notice] = 'Bug was successfully updated.'
      end
      if success
      	format.html { redirect_to([@report, @bug]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bug.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bugs/1
  # DELETE /bugs/1.xml
  def destroy
    @bug = Bug.find(params[:id])
    @bug.destroy
	@report = Report.find(params[:report_id])
    respond_to do |format|
      format.html { redirect_to(@report) }
      format.xml  { head :ok }
    end
  end
  
  def email_bug
    @bug = Bug.find(params[:id])
    logger.info "fadsfadsfadsfasdfasdfadsfadsfafasdfadfadsf"
    @bug.email_bug
    respond_to do |format|
      format.js {render :layout => false}
    end
  end
  
   def update_bug_status
    @bug = Bug.find(params[:id])
    bugStatus = BugStatus.find(params[:bug_status_id])
    @bug.bug_status = bugStatus
    @bug.save
    @report = @bug.report
    respond_to do |format|
      format.js {render :layout => false}
    end
  end
  
  def reselect_filters
  	
  end 
end
