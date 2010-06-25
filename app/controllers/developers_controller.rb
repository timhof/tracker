class DevelopersController < ApplicationController
  # GET /developers
  # GET /developers.xml
  def index
    @developers = Developer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @developers }
    end
  end

  # GET /developers/1
  # GET /developers/1.xml
  def show
    @developer = Developer.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @developer }
    end
  end
  
  # GET /developers/new
  # GET /developers/new.xml
  def new
    @developer = Developer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @developer }
    end
  end

  # GET /developers/1/edit
  def edit
    @developer = Developer.find(params[:id])
  end

  # POST /developers
  # POST /developers.xml
  def create
    @developer = Developer.new(params[:developer])

    respond_to do |format|
      if params[:commit].eql?('Create') && @developer.save
        flash[:notice] = 'Developer was successfully created.'
        format.html { redirect_to :action => "index" }
        format.xml  { render :xml => @developer, :status => :created, :location => @developer }
      elsif params[:commit].eql?('Cancel')
      	format.html { redirect_to(developers_url) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @developer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /developers/1
  # PUT /developers/1.xml
  def update
    @developer = Developer.find(params[:id])

    respond_to do |format|
      success = true
      if params[:commit].eql?('Update')
        success = @developer.update_attributes(params[:developer])
        flash[:notice] = 'Developer was successfully updated.'
      end
      if success
        format.html { redirect_to(developers_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @developer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /developers/1
  # DELETE /developers/1.xml
  def destroy
    @developer = Developer.find(params[:id])
    @developer.destroy

    respond_to do |format|
      format.html { redirect_to(developers_url) }
      format.xml  { head :ok }
    end
  end
end
