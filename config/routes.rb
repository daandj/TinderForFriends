Rails.application.routes.draw do

  root 'welcome#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

	get  '/signup' => 'users#new'
	post '/users' => 'users#create'
	get '/profile' => 'users#show_profile'
	get '/profile/edit' => 'users#edit'
	post '/profile/edit' => 'users#update'

	get '/new-friends' => 'users#new_chat'
	get '/chats' => 'users#chats'

	resources :chats, only: [:show] do
		resources :messages
	end

	post '/chats/:id' => 'chats#send'

end
