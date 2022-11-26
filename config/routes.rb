Rails.application.routes.draw do
  get 'home/index'
  get 'donor/donor_home'
  #get 'request/req'
  get 'admin/dashboard'
 # resources :admin
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    get "/admin_dashboard", to: "admin#dashboard"
    get "/admin_handled_request", to: "admin#admin_handled_request"
    
    # get "/admin_login", to: "admin#admin_login"
    get "/handle_req/:id", to: "admin#handle_req", as:"handle_req"
   # get "/donor_form", to: "donor#new_donor_form"
  # Defines the root path route ("/")
   root "home#index"
   #root "admin#admin_login"
   #root "sessions#home"
   resources :home,only:[:new,:check]
   get "forgot_password", to:"home#forgot_password",as:"forgot_password"
   post "/search",to:"home#check",as:"search"
   post "/reset_pwd",to:"home#reset_pwd",as:"reset_pwd"
   get "display_msg",to:"home#display_msg",as:"display_msg"
   get "reset_password", to:"home#reset_password",as:"reset_password"

   resources :donors
   resources :admins

   resources :requests
   get 'req_dashboard',to:'dashboard#index',as:'req_dashboard'
   get 'request_new',to:"requests#new",as:"request_new"
    get 'request_list',to:"requests#index",as:"request_list"
  resources :requestors
  resources :sessions,only: [:new,:create, :destory]
  get 'req_signup', to:'requestors#new', as:"req_signup"
  get 'req_login',to:"sessions#new",as:"req_login"
   get 'admin_login',to:"sessions#new_admin",as:"admin_login"
  get 'logout',to:"sessions#destroy", as: "logout"

end
