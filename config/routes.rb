Rails.application.routes.draw do
  get 'appointment/index', to: "appointments#index"
  post 'appointment/create'
  put 'appointment/:id', to: "appointment#update" , :as => "update_appointment_status"
  delete 'appointment/:id', to: "appointment#destroy"


  devise_for :users, :paths => "users" , controllers: { registrations: 'users/registrations' }

  resources :users do 
    resources :properties do
      delete "/:id" , to: "properties#delete_image_attachment", :as => "delete_image_attachment"
      put "/:publish_status", to: "properties#updatePublish", :as => "update_publish"
    end
  end

  resources :rent_properties, :only => [ :index, :show] do
    get '/page/:page', action: :index, on: :collection,:as => "page"
  end
  resources :sub_admin_properties, :only => [ :index, :show]

  

  devise_for :super_admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
 

  get "/search" , to: "rent_properties#search"

  get "/profile/:id", to: "users/profile#show", :as => "user_profile"

  get "/filter/flat", to: "rent_properties#Filter_for_flat"

  # delete "/property/image/:id", to: "properties#delete_image", :as => "delete_image"

  root "home#index"
  

  # get "/*a", to: "application#not_found"

  namespace :api do
    namespace :v1 do 
      get "/profile/:id", to: "users/profile#show", :as => "user_profile"
      devise_for :users,defaults: { format: :json },  :paths => "users" , controllers: { sessions: 'api/v1/users/sessions',registrations: 'api/v1/users/registrations' }
      resources :rent_properties, :only => [ :index, :show] do
        get '/page/:page', action: :index, on: :collection,:as => "page"
      end
      resources :users do 
        resources :properties do
          delete "/:id" , to: "properties#delete_image_attachment", :as => "delete_image_attachment"
          put "/:publish_status", to: "properties#updatePublish", :as => "update_publish"
        end
      end
    end 
  end


end
