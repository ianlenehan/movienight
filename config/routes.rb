# == Route Map
#
#   Prefix Verb  URI Pattern          Controller#Action
#     root GET   /                    pages#welcome
#    users GET   /users(.:format)     users#index
#          POST  /users(.:format)     users#create
# new_user GET   /users/new(.:format) users#new
#     user PATCH /users/:id(.:format) users#update
#          PUT   /users/:id(.:format) users#update
#

Rails.application.routes.draw do
  get 'session/new'

root :to => 'pages#welcome'

resources :users, :only  => [:new, :create, :index, :update, :show]

get '/users/edit' => 'users#edit'

get '/signup' => 'users#new'

get '/login' => 'session#new'
post '/login' => 'session#create'
delete '/login' => 'session#destroy'

end
