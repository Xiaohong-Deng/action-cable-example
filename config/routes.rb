Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "chatrooms#index"
  mount ActionCable.server, at: '/cable'
  resources :chatrooms, param: :slug # slug only change the default :id to :slug, value doesn't change
  resources :messages
end
