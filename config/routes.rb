Rails.application.routes.draw do
  resource :sign_in, only: [:create], controller: :sessions, defaults: { format: :json }
  resources :users, only: [:create, :index], defaults: { format: :json }
  get "/persons" => "persons#index"
end
