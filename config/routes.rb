ActionController::Routing::Routes.draw do |map|
  map.resources :usage_statuses

  map.resources :bug_statuses

  #map.resources :bugs

  map.resources :developers

  map.resources :descriptions

  map.resources :navigations

  map.resources :j_tracs

  map.resources :export_statuses

  map.resources :specs_statuses

  map.resources :test_statuses

  map.resources :report_statuses

  map.resources :reports do |report|
  	report.resources :bugs
  end
  
  map.root :controller => "reports", :action => "index"

  map.filter_reports '/filter', :controller => "reports", :action => "filter_reports"
  
  map.change_report_columns '/change_report_columns', :controller => "reports", :action => "change_columns"
  
  map.all_bugs '/all_bugs', :controller => 'bugs', :action => 'index'
  
  map.email_bug '/email_bug/:id', :controller => 'bugs', :action => 'email_bug'
  map.update_bug_status '/update_bug_status/:id/:bug_status_id', :controller => 'bugs', :action => 'update_bug_status'
 
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
