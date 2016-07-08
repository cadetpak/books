Rails.application.routes.draw do

root 'users#index'

#USER
post '/register' => 'users#create' 
post '/login' => 'users#login'
get '/dashboard' => 'users#dashboard'
delete '/users' => 'users#logout'

#BOOK
get '/new' => 'books#new'
post '/create_book' => 'books#create'
patch '/update/:id' => 'books#update'
delete '/delete/:id' => 'books#destroy'

end