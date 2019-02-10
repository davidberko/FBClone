Rails.application.routes.draw do

  get 'comments/new'

  devise_for :users, controllers: {
          sessions: 'users/sessions',
          registrations: 'users/registrations',
        }

  resources :users do
    resources :friendships
    resources :posts
    resources :friend_requests
  end

  resources :posts do
    resources :comments
  end

  resources :comments do
    resources :comments
  end

  root to: 'home_pages#index'
  get 'users/:id', to: 'users#show', as: 'profile'
  get 'users_search', to: 'users#index'

  get 'users/:id/profile_pic/edit', to: 'users#edit_profile_pic', as: 'edit_profile_pic'
  put 'users/:id/profile_pic', to: 'users#update_profile_pic', as: 'update_profile_pic'

  get 'users/:id/cover_photo/edit', to: 'users#edit_cover_photo', as: 'edit_cover_photo'
  put 'users/:id/cover_photo', to: 'users#update_cover_photo', as: 'update_cover_photo'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
