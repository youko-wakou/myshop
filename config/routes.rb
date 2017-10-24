Rails.application.routes.draw do
  
  root to: 'toppages#index'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'support', to: 'supports#show'
  get 'support', to: 'supports#create'
  get 'user_shops/show/:id' ,to: 'user_shops#show'
  post 'favorites_create',to: 'favorites#create'
  delete 'favorites_destroy',to: 'favorites#destroy'
  get 'messages_message',to: 'messages#message'
  get 'messages_receive',to: 'messages#receive'
  get 'messages_list',to: 'messages#list'
  get 'messages_message_get',to: 'messages#get_message'
  get 'user_message', to: 'messages#user_message'
  get 'users_list',to: 'users#list'
  get 'items_cart',to: 'items#cart'
  delete 'cart_delete',to: 'shopping_carts#destroy'
  post 'cart_create',to: 'shopping_carts#create'
  get 'shopping_history',to: 'shopping_carts#history'
  post 'shopping_list',to: 'shopping_carts#list'
  delete 'shopping_carts',to: 'shopping_carts#delete'
  get 'favorites_ranking',to: 'favorites#ranking'

  
  
  resources :images, only: [:create]
  resources :shopping_carts, only:[:index]
  resources :shops,only: [:index]
  resources :receives, only:[:index,:show,:create]
  resources :messages, only:[:index,:destroy,:show,:create]
  resources :favorites, only: [:index,:show]
  resources :user_shops, only: [:index,:create, :destroy,:create,:show]
  
  resources :items, only: [:index,:create,:destroy,:show]
  resources :profiles, only: [:create]
  resources :mypages, only: [:index]
  resources :users, only: [:index, :show, :new, :create]
  resources :supports, only: [:show, :create,:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
