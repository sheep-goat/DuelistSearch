Rails.application.routes.draw do
  root 'landing_pages#home'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get '/:username', to: 'users#show', as: 'user_show'
  get '/:username/edit', to: 'users#edit', as: 'user_edit'
  patch '/:username/edit', to: 'users#update'

  get 'posts/new'
  post 'posts/new', to: 'posts#create'
  get 'posts/search'
  get 'posts/tag'
  get '/:username/posts/:id', to: 'posts#show', as: 'post_show'
  post '/:username/posts/:id', to: 'favorites#create', as: 'favorite'
  delete '/:username/posts/:id', to: 'favorites#destroy', as: 'unfavorite'
  post '/:username/posts/:id/comment', to: 'comments#create', as: 'comment_create'

  post '/:username/posts/:id/join', to: 'participators#join', as: 'join'
  delete '/:username/posts/:id/join', to: 'participators#leave', as: 'leave'

  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
