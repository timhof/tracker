class ReportsController < ApplicationController
	
  require 'net/https'
  require 'open-uri'
  
  include ReportsHelper
  
   def index
    
   	set_filtered_reports
	
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reports }
    end
  end
  
  def index_print
    
   	set_filtered_reports

    respond_to do |format|
      format.html {render :layout => false}
      format.xml  { render :xml => @reports }
    end
  end
  
  def summary_report
  	StatusValue.new(0, 'whymustidothis')
  	
  	@developers = Developer.find(:all, :conditions => 'report_rank >= 0', :order => 'report_rank asc')
  	@issues = Issue.find(:all, :conditions => "issue_status_id <> #{IssueStatus::RESOLVED.id}")
  	
  	@all_reports = Report.find(:all, :include => :navigation, :order => "navigations.tier_1 asc, navigations.tier_2 asc, navigations.tier_3 asc")
	@reports = @all_reports.select {|report| 
		session[:selector].selectedTier2[report.nav_tier_2] == '1' &&
		session[:selector].selectedMaintainer[report.developer_id] == '1' &&
		session[:selector].selectedReportStatus[report.report_status_id] == '1'
	}
	
	@unassigned_qht = Developer.find(:first, :conditions => "report_rank = -1")
	@unassigned_l5m = Developer.find(:first, :conditions => "report_rank = -2")
	
  	respond_to do |format|
      format.html {render :layout => false}
      format.xml  { render :xml => @reports }
    end
  end
  
  def filter_reports
  	
  	@all_reports = Report.find(:all)
  	
  	if params[:filter_commit].eql?('update')
  		reselect_filters
  	end
  	
	set_filtered_reports
	
    respond_to do |format|
      format.xml  { render :xml => @reports }
      format.js {render :action => 'update_filter', :layout => false}
    end
  end
  
  def change_columns

  	if params[:column_commit].eql?('update')
  		reselect_columns
  	end
  	
  	set_filtered_reports
  	
    respond_to do |format|
      format.js {render :action => 'update_columns', :layout => false}
    end
  end
  
  def set_filtered_reports
  	
  	@all_reports = Report.find(:all, :include => :navigation, :order => "navigations.tier_1 asc, navigations.tier_2 asc, navigations.tier_3 asc")
	@reports = @all_reports.select {|report| 
		session[:selector].selectedTier2[report.nav_tier_2] == '1' &&
		session[:selector].selectedMaintainer[report.developer_id] == '1' &&
		session[:selector].selectedReportStatus[report.report_status_id] == '1'
	}
  end
  
	
  # GET /reports/1
  # GET /reports/1.xml
  def show
    @report = Report.find(params[:id])
	# if not @report.jtrac.url.nil?
	# 	 	logger.info "URL #{@report.jtrac.url}"
	# 	 	uri = URI.parse(@report.jtrac.url)
	# 	 	http = Net::HTTP.new(uri.host, uri.port)
	# 	 	http.use_ssl = true
	# 	 	http.verify_mode = OpenSSL::SSL::VERIFY_NONE
	# 	 	http.start do |http|
	# 	 		logger.info "INSIDE START"
	# 	 	  	req = Net::HTTP::Get.new("/")
	# 	 	  	req.basic_auth('timhof', '9miller')
	# 	 		response = http.request(req)
	# 			logger.info response.body
	# 		end
	# 		# => #<Net::HTTPOK 200 OK readbody=true>   
	# 	end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @report }
    end
  end

  # GET /reports/new
  # GET /reports/new.xml
  def new
  	
	StatusValue.new(0, 'whymustidothis')
    @report = Report.new
	@report.jtrac = JTrac.new
	@report.description = Description.new
	@report.navigation = Navigation.new
	@report.report_status_id = ReportStatus::TESTING_L5M.id
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @report }
    end
  end

  # GET /reports/1/edit
  def edit
    @report = Report.find(params[:id])
  end

  # POST /reports
  # POST /reports.xml
  def create
    @report = Report.new(params[:report])
    respond_to do |format|
      if params[:commit].eql?('Create') && @report.save
		session[:selector].confirm_report_data
        flash[:notice] = 'Report was successfully created.'
        format.html { redirect_to(reports_url) }
        format.xml  { render :xml => @report, :status => :created, :location => @report }
    elsif params[:commit].eql?('Cancel')
      	format.html { redirect_to(reports_url) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reports/1
  # PUT /reports/1.xml
  def update
    @report = Report.find(params[:id])
	session[:selector].confirm_report_data

    respond_to do |format|
      success = true
      if params[:commit].eql?('Update')
      	success = @report.update_attributes(params[:report])
		session[:selector].confirm_report_data
        flash[:notice] = 'Report was successfully updated.'
      end
      if success
      	format.html { redirect_to(report_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @report.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update_report_status
    @report = Report.find(params[:id])
    reportStatus = ReportStatus.find(params[:report_status_id])
    @report.report_status = reportStatus
    @report.save
    respond_to do |format|
      format.js {render :layout => false}
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.xml
  def destroy
    @report = Report.find(params[:id])
    @report.destroy

	session[:selector].confirm_report_data
    respond_to do |format|
      format.html { redirect_to(reports_url) }
      format.xml  { head :ok }
    end
  end
  
  private 
 
  def reselect_filters
  	
  	@all_reports = Report.find(:all)
	@all_reports.each do |report| 
	
		if (not params[:tier_1_2].nil?) && (params[:tier_1_2][report.nav_tier_2] == '1')
			session[:selector].selectedTier2[report.nav_tier_2] = '1'
		else
			session[:selector].selectedTier2[report.nav_tier_2] = '0'
		end
		if (not params[:maintainer].nil?) && (params[:maintainer][report.developer_id.to_s] == '1')
			session[:selector].selectedMaintainer[report.developer_id] = '1'
		else
			session[:selector].selectedMaintainer[report.developer_id] = '0'
		end
	end
	StatusValue.new(0, 'whymustidothis')
	
	@report_statuses = ReportStatus.values.each do |status|
		if (not params[:status].nil?) && (params[:status][status.id.to_s] == '1')
			session[:selector].selectedReportStatus[status.id] = '1'
		else
			session[:selector].selectedReportStatus[status.id] = '0'
		end
	end
	
  end
  
  def reselect_columns
  	
	ColumnIdNameMap.each do |column, label|
		if params[:columns][column] == '1'
			session[:selector].selectedColumns[column] = '1'
		else
			session[:selector].selectedColumns[column] = '0'
		end
	end
  end
end
