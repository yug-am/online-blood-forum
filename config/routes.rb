Rails.application.routes.draw do
  get 'donor/donor_home'
  #get 'request/req'
  get 'admin/dashboard'
 # resources :admin
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    get "/adm_  dashboard", to: "admin#dashboard"
    get "/handle_req/:id", to: "admin#handle_req", as:"handle_req"
   # get "/donor_form", to: "donor#new_donor_form"
  # Defines the root path route ("/")
   root "dashboard#index"
   #root "admin#admin_login"
   #root "sessions#home"
   resources :donors
   resources :admins

   resources :requests
   get 'req_dashbaord',to:'dashboard#index',as:'req_dashbaord'
   get 'request_new',to:"requests#new",as:"request_new"
    get 'request_list',to:"requests#index",as:"request_list"
  resources :requestors
  resources :sessions,only: [:new,:create, :destory]
  get 'req_signup', to:'requestors#new', as:"req_signup"
  get 'req_login',to:"sessions#new",as:"req_login"
  get 'logout',to:"sessions#destroy", as: "logout"

end
