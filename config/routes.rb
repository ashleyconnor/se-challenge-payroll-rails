Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: redirect("/report/new")
  get "/report/", to: "report#index"
  get "/report/new", to: "report#new"
  post "/report/new", to: "report#create"
end
