Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get 'articles' => 'articles#index'
      get 'articles/most_viewed' => 'articles#most_viewed'
      get 'articles/most_recent' => 'articles#most_recent'
      post 'views/create' => 'views#create'
    end
  end

  resources :articles
  resources :users
  root 'articles#index'
end
