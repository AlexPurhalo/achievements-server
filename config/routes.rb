Rails.application.routes.draw do
  resource :sign_in, only: [:create], controller: :sessions, defaults: { format: :json }
  resources :users, only: [:create, :index, :show, :destroy], defaults: { format: :json }
end
