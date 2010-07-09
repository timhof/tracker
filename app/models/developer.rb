class Developer < ActiveRecord::Base
	
	has_many :reports
	has_many :tasks, :order => "priority asc"
	
	validates_presence_of :first, :last, :email
	
	def full_name
		"#{first} #{last}"
	end
	
	def current_status_label
		DeveloperStatus.current_status_label(status)
	end
	
	def current_status
		DeveloperStatus.current_status(status)
	end
	
	def status_description_html
		return BlueCloth.new(status_description).to_html()
	end
	
	def inprogress_tasks
		Task.tasks_by_status(tasks, TaskStatus::INPROGRESS)
	end
	
	def open_tasks
		Task.tasks_by_status(tasks, TaskStatus::PLANNING)
	end
	
	def completed_tasks
		Task.tasks_by_status(tasks, TaskStatus::COMPLETE)
	end
	
	def queued_tasks
		Task.tasks_by_status(tasks, TaskStatus::QUEUED)
	end
	
	def planning_tasks
		Task.tasks_by_status(tasks, TaskStatus::PLANNING)
	end
	
	def testing_tasks
		Task.tasks_by_status(tasks, TaskStatus::TEST)
	end
	
	def totalDuration

    	totalDays = 0
     	inprogress_tasks.each do |task|
     		unless task.duration.nil?
       			totalDays = totalDays + task.duration
   			end
     	end
     	queued_tasks.each do |task|
     		unless task.duration.nil?
       			totalDays = totalDays + task.duration
   			end
     	end
     	planning_tasks.each do |task|
     		unless task.duration.nil?
       			totalDays = totalDays + task.duration
   			end
     	end
     	return totalDays
 	end
	
end
