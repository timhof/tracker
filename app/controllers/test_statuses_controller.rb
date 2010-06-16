class TestStatusesController < ApplicationController
  # GET /test_statuses
  # GET /test_statuses.xml
  def index
    @test_statuses = TestStatus.find(:all, :order => "rank asc")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @test_statuses }
    end
  end

  # GET /test_statuses/new
  # GET /test_statuses/new.xml
  def new
    @test_status = TestStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @test_status }
    end
  end

  # GET /test_statuses/1/edit
  def edit
    @test_status = TestStatus.find(params[:id])
  end

  # POST /test_statuses
  # POST /test_statuses.xml
  def create
    @test_status = TestStatus.new(params[:test_status])

    respond_to do |format|
      if @test_status.save
        flash[:notice] = 'TestStatus was successfully created.'
        format.html { redirect_to(test_statuses_url) }
        format.xml  { render :xml => @test_status, :status => :created, :location => @test_status }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @test_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /test_statuses/1
  # PUT /test_statuses/1.xml
  def update
    @test_status = TestStatus.find(params[:id])

    respond_to do |format|
      if @test_status.update_attributes(params[:test_status])
        flash[:notice] = 'TestStatus was successfully updated.'
      format.html { redirect_to(test_statuses_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @test_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /test_statuses/1
  # DELETE /test_statuses/1.xml
  def destroy
    @test_status = TestStatus.find(params[:id])
    @test_status.destroy

    respond_to do |format|
      format.html { redirect_to(test_statuses_url) }
      format.xml  { head :ok }
    end
  end
end
