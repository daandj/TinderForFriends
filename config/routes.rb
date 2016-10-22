Rails.application.routes.draw do

  root 'welcome#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

	get  '/signup' => 'users#new'
	post '/users' => 'users#create'
	get '/profile' => 'users#show_profile'
	get '/profile/edit' => 'users#edit'
	post '/profile/edit' => 'users#update'

end
