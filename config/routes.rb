Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

root to: "session#new"

get "/login", to: "session#new"
end
