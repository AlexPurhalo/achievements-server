Rails.application.routes.draw do
  get "/persons" => "persons#index"
end
