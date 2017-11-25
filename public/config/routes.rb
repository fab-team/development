Rails.application.routes.draw do

  resources :board_messages
  resources :board_users
  devise_for :accounts
	resources :answers
	resources :questions
	### People controller ###

	get 'helo/login_check'

	get 'people/index'
	get 'people', to: 'people#index'

	get 'people/find'
	post 'people/find'

	get 'people/add'
	post 'people/add', to: 'people#create'

	get 'people/edit/:id', to: 'people#edit'
	post 'people/edit/:id', to: 'people#update'
	patch 'people/edit/:id', to: 'people#update'

	get 'people/:id', to: 'people#show'

	get 'people/delete/:id', to: 'people#delete'

	### Dengonban controller ###

	get 'dengonban', to: 'dengonban#index'
	post 'dengonban', to: 'dengonban#index'
	get 'dengonban/index'
	post 'dengonban/index'

	### helo controller ###

	get 'helo', to: 'helo#index'
	get 'helo/index'
	post 'helo', to: 'helo#index'
	post 'helo/index'
	get 'helo/other'
end
