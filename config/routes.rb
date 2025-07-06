Rails.application.routes.draw do
  get 'items/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root 'homes#top'

  resource :account, only: [:show]
  resource :profile, only: [:show, :edit, :update]

  resources :items

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
