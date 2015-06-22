Rails.application.routes.draw do

  namespace :api do
    resources :categories, except: [:new, :edit] 
  end

  get 'tweets/index' => 'tweets#index', as: :tweets

  # get 'tweets/get_latest' => 'tweets#get_latest', as: :get_latest


  root 'pages#index'

  get 'pages/index' => 'pages#index', as: :welcome

  get 'pages/about' => 'pages#about', as: :about

  get 'users/index' => 'users#index', as: :users

  get 'users/show/:id' => 'users#show', as: :user

  get '/auth/:provider/callback' => 'sessions#create', as: :twitter

  delete '/logout' => 'sessions#destroy'

  get 'tweets/new' => 'tweets#new', as: :new_tweet

  post 'tweets/create' => 'tweets#create', as: :create_tweet

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


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
