AmericaSolidaria::Application.routes.draw do
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#home'

  resources :users do
    get 'my_projects'
    resources :volunteer_apps
    resources :skills
  end

  resources :volunteer_apps
  resources :skills

  resources :sessions, only: [ :new, :create, :destroy ]
  resources :projects do
    get 'join'
    get 'unjoin'
    post 'create_post'
    get 'view_requests'
    get "/projects/:project_id/accept_request/:request_id" => 'projects#accept_request', as: 'accept_request'
    get "/projects/:project_id/deny_request/:request_id" => 'projects#deny_request', as: 'deny_request'
  end 
  resources :posts
  
  match '/signup', to: 'users#new', via: 'get'

  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

  match '/help', to: 'static_pages#help', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'  # The priority is based upon order of creation: first created -> highest priority.

  get "/users/:user_id/apply" => 'volunteer_apps#new', as: 'apply'
  post "users/:user_id/view_app" => 'volunteer_apps#show', as: 'view_app'
  get "users/:user_id/edit_app" => 'volunteer_apps#edit', as: 'edit_app'

  get "public_chat_room/:id" => 'public_chat_room#index', as: 'public_chat'
  get "admin_chat_room/:id" => 'admin_chat_room#index', as: 'admin_chat'


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
