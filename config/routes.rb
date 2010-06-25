ActionController::Routing::Routes.draw do |map|
  map.resources :issues

  map.resources :tasks
  
  map.resources :developers

  map.resources :descriptions

  map.resources :navigations

  map.resources :j_tracs

  map.resources :reports do |report|
  	report.resources :bugs
  end
  
  map.root :controller => "reports", :action => "index"

  map.filter_reports '/filter_reports', :controller => "reports", :action => "filter_reports"
  map.filter_bugs '/filter_bugs', :controller => "bugs", :action => "filter_bugs"
  map.filter_tasks '/filter_tasks', :controller => "tasks", :action => "filter_tasks"
  
  map.change_report_columns '/change_report_columns', :controller => "reports", :action => "change_columns"
  
  map.reports_index_print 'reports_index_print', :controller => "reports", :action => "index_print"
  map.summary_report 'summary_report', :controller => "reports", :action => "summary_report"
  
  map.all_bugs '/all_bugs', :controller => 'bugs', :action => 'index'
  
  map.email_bug '/email_bug/:id', :controller => 'bugs', :action => 'email_bug'
  map.update_bug_status '/update_bug_status/:id/:bug_status_id', :controller => 'bugs', :action => 'update_bug_status'
 
  map.update_report_status '/update_report_status/:id/:report_status_id', :controller => 'reports', :action => 'update_report_status'
  
  map.update_task_status '/update_task_status/:id/:task_status_id', :controller => 'tasks', :action => 'update_task_status'
  
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
