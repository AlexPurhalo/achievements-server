Rails.application.routes.draw do
  resource :sign_in, only: [:create], controller: :sessions, defaults: { format: :json }

  resources :users, only: [:create, :index, :show, :destroy, :update], defaults: { format: :json }, :skip => [:registrations] do
    resources :achievements, only: [:create, :show, :index, :update, :destroy]
    resources :skills, only: [:index, :create, :destroy]
    resources :works, only: [:index, :show, :create, :update, :destroy]
  end
end
