class Task < ActiveRecord::Base
	
	belongs_to :developer
	belongs_to :report
	
	validates_presence_of :name
	
	def notes_html
		return BlueCloth.new(notes).to_html()
	end
	
	def description_html
		return BlueCloth.new(description).to_html()
	end
	
	def task_status
		return TaskStatus.current_status(task_status_id)
	end
	
	def current_status_label
		 StatusValue.new(0, 'whymustidothis')
		return TaskStatus.current_status_label(task_status_id)
	end
	
	def self.tasks_by_status(tasks, status)
		tasksByStatus = tasks.select do |task|
			task.task_status_id == status.id
		end
	end
	
	def self.unassigned_tasks
		Task.find(:all, :conditions => "task_status_id = #{TaskStatus::PLANNING.id}")
	end
	
	def self.project_tasks(project_id)
		project_tasks = Task.find(:all).select do |task|
			task.project_id == project_id
		end
	end
	
	def is_open
		task_status_id == TaskStatus::PLANNING.id
	end
	
	def is_inprogress
		task_status_id == TaskStatus::INPROGRESS.id
	end
	
	def is_complete
		task_status_id == TaskStatus::COMPLETE.id
	end
	
	def project_id
		project.nil? ? "_" : project.gsub(" ", "_")
	end
end

