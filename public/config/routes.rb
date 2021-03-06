Rails.application.routes.draw do
  root "top#index"
  get "about" => "top#about", as: "about"
  get "bad_request" => "top#bad_request"
  get "internal_server_error" => "top#internal_server_error"
  get "lesson/:action(/:name)" => "lesson"

  resources :members, only: [:index, :show] do
    collection { get "search" }
    resources :entries, only: [:index]
  end
  resources :articles, only: [:index, :show]
  resources :entries do
  	# @like 「いいね」した時に「votes」テーブルにレコードを作成
  	# @unlike 自分の投票を削除
  	# @voted 自分の投票の記事一覧を表示
  	member { patch "like", "unlike" }
  	collection { get "voted" }
  end
  resource :session, only: [:create, :destroy]
  resource :account

  namespace :admin do
    root "top#index"
    resources :members do
      collection { get "search" }
    end
    resources :articles
  end

  match "*anything" => "top#not_found", via: [:get, :post, :patch, :delete]


 #  resources :board_messages
 #  resources :board_users
 #  devise_for :accounts
	# resources :answers
	# resources :questions
	# ### People controller ###

	# get 'helo/login_check'

	# get 'people/index'
	# get 'people', to: 'people#index'

	# get 'people/find'
	# post 'people/find'

	# get 'people/add'
	# post 'people/add', to: 'people#create'

	# get 'people/edit/:id', to: 'people#edit'
	# post 'people/edit/:id', to: 'people#update'
	# patch 'people/edit/:id', to: 'people#update'

	# get 'people/:id', to: 'people#show'

	# get 'people/delete/:id', to: 'people#delete'

	# ### Dengonban controller ###

	# get 'dengonban', to: 'dengonban#index'
	# post 'dengonban', to: 'dengonban#index'
	# get 'dengonban/index'
	# post 'dengonban/index'

	# ### helo controller ###

	# get 'helo', to: 'helo#index'
	# get 'helo/index'
	# post 'helo', to: 'helo#index'
	# post 'helo/index'
	# get 'helo/other'
	# root to: 'board_messages#index'
end
