Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root 'homes#top'
  get '/top', to: 'homes#top'
  get 'search', to:'searches#search'

  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'

  get '/homes/favorite', to: 'homes#favorite'

  resource :account, only: [:show]
  resource :profile, only: [:show, :edit, :update]

  resources :items do
    resource :interesteds, only: [:create, :destroy]
  end

  resources :purchases

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
