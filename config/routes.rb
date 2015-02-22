Rails.application.routes.draw do
  get '/messages' => 'messages#show'
  # Redirect to login or channel picker if necessary
  get '/bios/:name'     => 'bios#show'
  get '/'         => 'pages#show'
  post '/messages' => 'messages#create'

  #login -> [register] -> channel picker -> messages/show
  # login page
  get '/login' => 'login#show'
  post '/login' => 'login#auth'
  # User registration page (new username)
  get '/register' => 'register#show'
  post '/register' => 'register#create'
  # Channel picker
  get '/channel' => 'channel#show'
  post '/channel' => 'channel#set'


end
