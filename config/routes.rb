Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root 'homes#top'

  resource :account, only: [:show]
  resource :profile, only: [:show, :edit, :update]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
