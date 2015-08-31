Rails.application.routes.draw do

  namespace :api do

    resources :categories, except: [:new, :edit]
  end

  #send users to the welcome page upon arrival
  root 'pages#index'

  #basic static pages, welcome, about, and contact
  get 'pages/index' => 'pages#index', as: :welcome

  get 'pages/about' => 'pages#about', as: :about

  get 'pages/dashboard' => 'pages#dashboard', as: :dashboard

  get 'pages/hashboard' => 'pages#hashboard', as: :hashboard

  #create a new session for twitter oauth
  get '/auth/:provider/callback' => 'sessions#create', as: :twitter

  #delete session for twitter oauth
  delete '/logout' => 'sessions#destroy'

  get 'labels/index' => 'labels#index', as: :labels

  get 'labels/show/:id' => 'labels#show', as: :label

  get 'labels/new' => 'labels#new', as: :new_label

  post 'labels/create' => 'labels#create'

  post 'api/categories/rank_tags' => 'api/categories#rank_tags'

  #get all the current tweet in our db
  get 'tweets/index' => 'tweets#index', as: :tweets

  #compose a new tweet
  get 'tweets/new' => 'tweets#new', as: :new_tweet

  #create the tweet on your twitter account
  post 'tweets/create' => 'tweets#create'

  #hit the twitter REST API and get some tweets for the db
  post 'tweets/get_latest' => 'tweets#get_latest'

  post 'tweets/get_latest' => 'tweets#get_latest'
end
