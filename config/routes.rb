Rails.application.routes.draw do
  get 'users/show'
  get 'users/new'
  get 'home_pages/index'
  devise_for :users, controllers: {
          sessions: 'users/sessions',
          registrations: 'users/registrations',
        }
  root to: 'home_pages#index'
  get 'user_id', to: 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
