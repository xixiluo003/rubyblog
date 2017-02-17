Rails.application.routes.draw do

  resources :users do
    resources :posts
  end
  resources :comments

  get "/" => "users#login"
  get "/login" => "users#login"
  get "/signin" => "users#signin"
  get "/home" => "users#home"
  get "/signout" => "users#signout"
  post "/user/:id/posts" => "posts#create"
  get "/posts_index" => "posts#index"


end
