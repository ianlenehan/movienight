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
get '/groups/search' => 'groups#search'
get '/groups/:id/edit' => 'groups#edit', :as => 'group_edit'
get '/groups/:id/join' => 'groups#join', :as => 'group_join'
get '/groups/approve/:id' => 'groups#accept_member'
get '/groups/reject/:id' => 'groups#reject_member'

get '/events/:id/search' => 'events#search'
get '/events/:id/delete' => 'events#destroy'
get '/details/:id/:imdbid' => 'events#details'
get '/details/:id/:imdbid/update_movie' => 'events#update_movie'
post '/events/:id/attending' => 'events#attending', :as => 'event_attending'
post '/events/:id/not_attending' => 'events#not_attending', :as => 'event_not_attending'

resources :users, :only  => [:new, :create, :index, :update, :show]
resources :groups, :only => [:new, :create, :index, :update, :show]
resources :events

get '/signup' => 'users#new'

get '/login' => 'session#new'
post '/login' => 'session#create'
delete '/login' => 'session#destroy'

end
