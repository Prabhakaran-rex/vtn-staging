PurexNew::Application.routes.draw do
  
  match "tags/create" => "tags#create", :as => :annotate
  match "tags/destroy" => "tags#destroy", :as => :destroy_tag

  resources :payments
  get "appraisal_data/create"
  match '/facebook/' => "users#facebook_login"

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", :registrations => "registrations"}  do
    get '/admin/dashboard' => 'users/admin/dashboard#show'
    get '/admin/dashboard/appraisers' => 'users/admin/dashboard#appraisers_index'
    get '/admin/dashboard/invites' => 'users/admin/dashboard#appraisers_invite_index'
    get '/users/appraiser_sign_up' => 'registrations#new_appraiser', :as => :new_appraiser_registration
  end


  resources :appraiser_steps
  resources :photos
  get '/photos/tag/:appraisal_id/:photo_id' => 'photos#tag', :as => :photo_tag

  resources :appraisals do
    resources :photos
    member do
      get 'reply'
      get 'claim'
    end
  end

  resources :appraiser_access_tokens

  resource :appraiser , :controller => "appraiser" do
    resources :skills
    resources :photos
  end

  get '/skills/getRootCategories' => 'skills#getRootCategories'
  get '/skills/getCategories' => 'skills#getCategories'
  
  resources :skills
  resources :users

  root :to => 'home#index'
    
  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match 'contact' => 'contact#create', :as => 'contact', :via => :post
  
  get '/home/how' => 'home#how', :as => 'how'
  get '/home/become' => 'home#become', :as => 'become'
  get '/home/privacy' => 'home#privacy', :as => 'privacy'
  get '/home/terms' => 'home#terms', :as => 'terms'
  get '/home/categories' => 'home#categories', :as => 'categories'
  get '/home/exclusions' => 'home#exclusions', :as => 'exclusions'
  get '/photos/create'
  post '/photos/create'


  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
