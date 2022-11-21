Rails.application.routes.draw do
  get 'donor/donor_home'
  #get 'request/req'
  get 'admin/dashboard'
 # resources :admin
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    get "/dashboard", to: "admin#dashboard"
    get "/handle_req/:id", to: "admin#handle_req", as:"handle_req"
    get "/donor_form", to: "donor#new_donor_form"
  # Defines the root path route ("/")
   #root "admin#dashboard"
   root "donor#new_donor_form"
   
   resources :donors
end
