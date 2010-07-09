class TestPlansController < ApplicationController

  
  def show
    @test_plan = TestPlan.find(params[:id])
	@report = Report.find(params[:report_id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @test_plan }
    end
  end

  def new
    @test_plan = TestPlan.new
	@report = Report.find(params[:report_id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @test_plan }
    end
  end

  def edit
    @test_plan = TestPlan.find(params[:id])
	@report = Report.find(params[:report_id])
  end

  def create
    @test_plan = TestPlan.new(params[:test_plan])
    @report = Report.find(params[:report_id])
    @test_plan.report = @report
    respond_to do |format|
      if params[:commit].eql?('Create') && @test_plan.save
          flash[:notice] = 'Test Plan was successfully created.'
      	  format.html { redirect_to([@report, @test_plan]) }
      elsif params[:commit].eql?('Create & Add') && @test_plan.save
          flash[:notice] = 'Test Plan was successfully created.'
      	  @test_plan = TestPlan.new
      	  format.html { render :action => "new" }
      elsif params[:commit].eql?('Cancel')
      	format.html { redirect_to(@report) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @test_plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @test_plan = TestPlan.find(params[:id])
	@report = Report.find(params[:report_id])
    respond_to do |format|
      success = true
      if params[:commit].eql?('Update')
      	success = @test_plan.update_attributes(params[:test_plan])
      	flash[:notice] = 'Test Plan was successfully updated.'
      end
      if success
      	format.html { redirect_to([@report, @test_plan]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @test_plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @test_plan = TestPlan.find(params[:id])
    @test_plan.destroy
	@report = Report.find(params[:report_id])
    respond_to do |format|
      format.html { redirect_to(@report) }
      format.xml  { head :ok }
    end
  end
  
  
end
