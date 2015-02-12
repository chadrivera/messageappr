Rails.application.routes.draw do
  get '/messages' => 'messages#show'
  get '/bios/:name'     => 'bios#show'
  get '/'         => 'pages#show'
  post '/messages' => 'messages#create'
end
