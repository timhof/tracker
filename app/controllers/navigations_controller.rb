class NavigationsController < ApplicationController
  # GET /navigations
  # GET /navigations.xml
  def index
    @navigations = Navigation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @navigations }
    end
  end

  # GET /navigations/1
  # GET /navigations/1.xml
  def show
    @navigation = Navigation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @navigation }
    end
  end

  # GET /navigations/new
  # GET /navigations/new.xml
  def new
    @navigation = Navigation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @navigation }
    end
  end

  # GET /navigations/1/edit
  def edit
    @navigation = Navigation.find(params[:id])
  end

  # POST /navigations
  # POST /navigations.xml
  def create
    @navigation = Navigation.new(params[:navigation])

    respond_to do |format|
      if @navigation.save
        flash[:notice] = 'Navigation was successfully created.'
        format.html { redirect_to(@navigation) }
        format.xml  { render :xml => @navigation, :status => :created, :location => @navigation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @navigation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /navigations/1
  # PUT /navigations/1.xml
  def update
    @navigation = Navigation.find(params[:id])

    respond_to do |format|
      if @navigation.update_attributes(params[:navigation])
        flash[:notice] = 'Navigation was successfully updated.'
        format.html { redirect_to(@navigation) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @navigation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /navigations/1
  # DELETE /navigations/1.xml
  def destroy
    @navigation = Navigation.find(params[:id])
    @navigation.destroy

    respond_to do |format|
      format.html { redirect_to(navigations_url) }
      format.xml  { head :ok }
    end
  end
end
