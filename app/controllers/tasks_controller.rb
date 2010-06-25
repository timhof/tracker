class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.xml
  def index
    
  	set_filtered_tasks

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.xml
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.xml
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.xml
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if params[:commit].eql?('Create') && @task.save
        flash[:notice] = 'Task was successfully created.'
        format.html { redirect_to(tasks_url) }
        format.xml  { render :xml => @task, :status => :created, :location => @task }
      elsif params[:commit].eql?('Cancel')
      	format.html { redirect_to(tasks_url) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.xml
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      success = true
      if params[:commit].eql?('Update')
      	success = @task.update_attributes(params[:task])
        flash[:notice] = 'Task was successfully updated.'
      end
      if success
      	format.html { redirect_to(task_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.xml
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.xml  { head :ok }
    end
  end
  
  def filter_tasks
  	
  	@all_tasks = Task.find(:all)
  	
  	if params[:filter_commit].eql?('update')
  		reselect_filters
  	end
  
	set_filtered_tasks
	
    respond_to do |format|
      format.xml  { render :xml => @reports }
      format.js {render :action => 'update_filter', :layout => false}
    end
  end
  
  def reselect_filters
  	logger.info "INSIDE reselect_filters"
  	
  	StatusValue.new(0, 'whymustidothis')
  	
  	@all_tasks = Task.find(:all)
	
	@task_statuses = TaskStatus.values.each do |status|

		if (not params[:status].nil?) && (params[:status][status.id.to_s] == '1')
			session[:selector].selectedTaskStatus[status.id] = '1'
		else
			session[:selector].selectedTaskStatus[status.id] = '0'
		end
	end
	logger.info session[:selector].selectedTaskStatus
  end
  
  def set_filtered_tasks
  	
  	@all_tasks = Task.find(:all)
	@tasks = @all_tasks.select{|task| 
		session[:selector].selectedTaskStatus[task.task_status_id] == '1'
	}
  end
  
   def update_task_status
    @task = Task.find(params[:id])
    @task.task_status_id = params[:task_status_id]
    @task.save
    respond_to do |format|
      format.js {render :layout => false}
    end
  end
end
