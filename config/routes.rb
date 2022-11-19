Rails.application.routes.draw do
  get 'admin/dashboard'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    get "/dashboard", to: "admin#dashboard"
  # Defines the root path route ("/")
   root "admin#dashboard"
end
