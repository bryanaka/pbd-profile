PbdPortal::Application.routes.draw do
  
  match "/" => "sessions#create"

 # mount Ckeditor::Engine => 'ckeditor'

  scope :pbdportal, :path => "/pbdportal" do

    root :to => 'sessions#create'
    mount Ckeditor::Engine => 'ckeditor'

    match "/home" => "pages#index"
    match "/unconfirmed" => "pages#unconfirmed"
    
    get '/docs' => 'high_voltage/pages#show', :id => 'index'
    get '/docs/api' => 'high_voltage/pages#show', :id => 'api/index'
    get '/docs/:id' => 'high_voltage/pages#show'

    resources :videos
    resources :news
    
    get "/users" => "users#index"
  
    match "/login" => "sessions#create"
    match "/logout" => "sessions#destroy"
  
  
    # Use Routes with Backbone
    match "/scientists/"          => "scientists#index"
    match "/scientists/:id"       => "scientists#index"
    match "/scientists/:id/edit"  => "scientists#index"
    match "/scientists/new"       => "scientists#index"
  
    namespace :api, defaults: {format: 'json'} do
      namespace :v1 do
        match "/scientists/:slug", :controller => "scientists", :action => "show_by_slug", :constraints => { :slug => /[a-zA-Z]+/ }
        resources :scientists do
          resources :websites
          resources :titles, :controller => "scientists_titles"
        end
        resources :videos
        get "websites/all" => "websites#show_all"
      end
    end

  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
