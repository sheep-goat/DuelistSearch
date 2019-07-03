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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
