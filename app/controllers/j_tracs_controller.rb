class JTracsController < ApplicationController
  # GET /j_tracs
  # GET /j_tracs.xml
  def index
    @j_tracs = JTrac.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @j_tracs }
    end
  end

  # GET /j_tracs/new
  # GET /j_tracs/new.xml
  def new
    @j_trac = JTrac.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @j_trac }
    end
  end

  # GET /j_tracs/1/edit
  def edit
    @j_trac = JTrac.find(params[:id])
  end

  # POST /j_tracs
  # POST /j_tracs.xml
  def create
    @j_trac = JTrac.new(params[:j_trac])

    respond_to do |format|
      if @j_trac.save
        flash[:notice] = 'JTrac was successfully created.'
        format.html { redirect_to :action => "index" }
        format.xml  { render :xml => @j_trac, :status => :created, :location => @j_trac }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @j_trac.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /j_tracs/1
  # PUT /j_tracs/1.xml
  def update
    @j_trac = JTrac.find(params[:id])

    respond_to do |format|
      if @j_trac.update_attributes(params[:j_trac])
        flash[:notice] = 'JTrac was successfully updated.'
        format.html { redirect_to(@j_trac) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @j_trac.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /j_tracs/1
  # DELETE /j_tracs/1.xml
  def destroy
    @j_trac = JTrac.find(params[:id])
    @j_trac.destroy

    respond_to do |format|
      format.html { redirect_to(j_tracs_url) }
      format.xml  { head :ok }
    end
  end
end
