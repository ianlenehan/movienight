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

root :to => 'pages#welcome'

get '/users/edit' => 'users#edit'
# get '/group/edit' => 'groups#edit'
get '/groups/:id/edit' => 'groups#edit', :as => 'group_edit'

get '/events/:id/search' => 'events#search'
get '/details/:id/:imdbid' => 'events#details'
get '/details/:id/:imdbid/update_movie' => 'events#update_movie'

resources :users, :only  => [:new, :create, :index, :update, :show]
resources :groups, :only => [:new, :create, :index, :update, :show]
resources :events, :only => [:show, :new, :create, :index, :update, :search]

get '/signup' => 'users#new'

get '/login' => 'session#new'
post '/login' => 'session#create'
delete '/login' => 'session#destroy'

end
