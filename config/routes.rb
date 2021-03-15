Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1 do
    jsonapi_resources :cities
    jsonapi_resources :users
  end
end
