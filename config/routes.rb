Rails.application.routes.draw do
  devise_for :users
  get "/persons" => "persons#index"
end
