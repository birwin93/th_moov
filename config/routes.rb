ThMoov::Application.routes.draw do
 
  #get 'events/search/:search', to: "events#search", as: "search"

  resources :events do
    resources :event_memberships
    resources :posts
  end

  post 'events/:event_id/posts', to: "events#add_post", as: 'add_event_post'
  
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')


  resources :loops do
    resources :loop_memberships
    resources :loop_event_shares
    resources :posts
  end

  resources :users

  resources :sessions, only: [:create, :destroy]

  root to: "site#landing"

  match "/about", to: "site#about"
  match "/contact", to: "site#contact"
  match "/help", to: "site#help"

  match "/signup", to: "users#new"
  match "/signout", to: "sessions#destroy", via: :delete

  put "loop_memberships/:id/accept", to: "loop_memberships#accept", as: 'accept_loop_membership'
  put "loop_memberships/:id/decline", to: "loop_memberships#decline", as: 'decline_loop_membership'

  post "events/:id/join", to: "events#join", as: "join_event"

  post "/events/:event_id/loops/:loop_id/loop_event_shares", to: "loop_event_shares#create", as: 'share_event'
  get "/loops/:loop_id/events/new", to: 'events#new', as: 'loop_new_event'
  post "/loops/:loop_id/events", to: 'events#create', as: 'loop_create_event'
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
