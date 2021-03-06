Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # get '/users', to: 'users#index', as: 'users'
  # post '/users', to: 'users#create', as: 'create_user'
  # get '/users/new', to: 'users#new', as: 'new_user'
  # get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  # get '/users/:id', to: 'users#show', as: 'show_user'
  # patch '/users/:id', to: 'users#update', as: 'update_column_user'
  # put '/users/:id', to: 'users#update', as: 'update_all_user'
  # delete '/users/:id', to: 'users#destroy', as: 'delete_user'

  resources :users, only: [:index, :create, :show, :update, :destroy] do
    resources :artworks, only: [:index]
    resources :artwork_shares, only:[:index]
  end

  resources :artworks, only: [:create, :show, :update, :destroy]

  resources :artwork_shares, only:[:create, :destroy]

end
