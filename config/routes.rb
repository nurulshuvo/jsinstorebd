Jsinstorebd::Application.routes.draw do
  match '/rate' => 'rater#create', :as => 'rate'

  resources :reports, only: :create


  resources :payment_notifications, except: [:show, :new]


root to: 'store#index', as: 'store'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :thanas
  resources :districts
  resources :divisions
  resources :categories
  resources :searches

  devise_for :users, :path => '/'
  ActiveAdmin.routes(self)

  match 'users/:id' => 'users#show', as: :user
  match 'profile/:id' => 'users#profile', as: :profile

  resources :users do
    resources :products
  end
  resources :orders

  resources :line_items


  resources :carts

  resources :products do
    get :who_bought, on: :member
  end



match 'messages' => 'messages#index', as: :messages
match 'messages/new' => 'messages#new', as: :new_message
match 'messages/new/:email' => 'messages#new', as: :new_email_message
match 'messages/create' => 'messages#create', as: :create_message
match 'messages/show/:id' => 'messages#show', as: :message
match 'messages/delete/:id' => 'messages#destroy', as: :delete_message
match 'messages/outbox' => 'messages#outbox', as: :outbox
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
