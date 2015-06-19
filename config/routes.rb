Rails.application.routes.draw do

  #send users to the welcome page upon arrival
  root 'pages#index'

  #basic static pages, welcome, about, and contact
  get 'pages/index' => 'pages#index', as: :welcome

  get 'pages/about' => 'pages#about', as: :about

  #create a new session for twitter oauth
  get '/auth/:provider/callback' => 'sessions#create', as: :twitter

  #delete session for twitter oauth
  delete '/logout' => 'sessions#destroy'

  #get all the current tweet in our db
  get 'tweets/index' => 'tweets#index', as: :tweets

  #compose a new tweet
  get 'tweets/new' => 'tweets#new', as: :new_tweet

  #create the tweet on your twitter account
  post 'tweets/create' => 'tweets#create'

  #hit the twitter REST API and get some tweets for the db
  post 'tweets/get_latest' => 'tweets#get_latest'

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
