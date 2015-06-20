Rails.application.routes.draw do

  #send users to the welcome page upon arrival
  root 'pages#index'

  #monkey learn
  get 'categories/index'

  get 'categories/show'

  #basic static pages, welcome, about, and contact
  get 'pages/index' => 'pages#index', as: :welcome

  get 'pages/about' => 'pages#about', as: :about

  #create a new session for twitter oauth
  get '/auth/:provider/callback' => 'sessions#create', as: :twitter

  #delete session for twitter oauth
  delete '/logout' => 'sessions#destroy'

  get 'categories/index' => 'categories#index', as: :categories

  get 'categories/show/:id' => 'categories#show', as: :category

  get 'categories/new' => 'categories#new', as: :new_category

  post 'categories/create' => 'categories#create'

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
