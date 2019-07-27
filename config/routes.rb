Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :authorizations, :applications,
      :authorized_applications
  end
  devise_for :users, :controllers => {sessions: 'sessions', registrations: 'registrations'} 
  resources :items
  root to: 'items#index'

  namespace :api do
    resources :items
    get 'users', to: 'users#index'
  end

end
