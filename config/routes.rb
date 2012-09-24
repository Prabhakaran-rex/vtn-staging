PurexNew::Application.routes.draw do

  match "tags/create" => "tags#create", :as => :annotate
  match "tags/destroy" => "tags#destroy", :as => :destroy_tag

  resources :payments
  get "appraisal_data/create"
  match '/facebook/' => "users#facebook_login"

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", :registrations => "registrations"}  do
    get '/admin/dashboard' => 'users/admin/dashboard#show'
    get '/admin/dashboard/appraisers' => 'users/admin/dashboard#appraisers_index', :as => :admin_appraisers
    get '/admin/dashboard/invites' => 'users/admin/dashboard#appraisers_invite_index', :as => :admin_invites
    get '/users/appraiser_sign_up' => 'registrations#new_appraiser', :as => :new_appraiser_registration
  end

    get '/users/save_json_signature' => 'users#save_json_signature', :as => :save_json_signature
    get '/users/new_signature' => 'users#new_signature', :as => :new_signature
    post '/users/save_signature' => 'users#save_signature', :as => :save_signature
    match '/users/crop_signature' => 'users#crop_signature', :as => :crop_signature

  resources :appraiser_steps
  resources :photos
  get '/photos/tag/:appraisal_id/:photo_id' => 'photos#tag', :as => :photo_tag

  match '/appraisals/wizard_photo_upload/:appraisal_id' => 'appraisals#wizard_photo_upload', :as => :wizard_photo_upload
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
  
  resources :skills
  resources :users

  root :to => 'home#index'
    
  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match 'contact' => 'contact#create', :as => 'contact', :via => :post
  match 'complaint' => 'contact#complaint', :as => 'complaints', :via => :get
  get 'tickets' => 'contact#tickets', :as => :tickets
  get 'ticket' => 'contact#ticket', :as => :new_ticket
  post 'ticket' => 'contact#ticket_create', :as => :ticket_create
  match '/tickets/:id' => "contact#show", :as => :show_ticket
  
  get '/home/how' => 'home#how', :as => 'how'
  get '/home/become' => 'home#become', :as => 'become'
  get '/home/privacy' => 'home#privacy', :as => 'privacy'
  get '/home/terms' => 'home#terms', :as => 'terms'
  get '/home/categories' => 'home#categories', :as => 'categories'
  get '/home/exclusions' => 'home#exclusions', :as => 'exclusions'
  get '/home/ethics' => 'home#ethics', :as => 'ethics'
  get '/home/determining' => 'home#determining', :as => 'determining'
  get '/home/limiting' => 'home#limiting', :as => 'limiting'
  get '/home/appraiser_invite' => 'home#appraiser_invite'
  get '/photos/create'
  post '/photos/create'

  ActiveAdmin.routes(self)
  # Begin ComfortableMexicanSofa
  namespace :cms_admin, :path => ComfortableMexicanSofa.config.admin_route_prefix, :except => :show do
      get '/', :to => 'cms_admin/sites#index'
      resources :sites do
        resources :pages do
          get  :form_blocks,    :on => :member
          get  :toggle_branch,  :on => :member
          put :reorder,         :on => :collection
          resources :revisions, :only => [:index, :show, :revert] do
            put :revert, :on => :member
          end
        end
        resources :files do
          put :reorder, :on => :collection
        end
        resources :layouts do
          put :reorder, :on => :collection
          resources :revisions, :only => [:index, :show, :revert] do
            put :revert, :on => :member
          end
        end
        resources :snippets do
          put :reorder, :on => :collection
          resources :revisions, :only => [:index, :show, :revert] do
            put :revert, :on => :member
          end
        end
        resources :categories
        get 'dialog/:type' => 'dialogs#show', :as => 'dialog'
      end
    end unless ComfortableMexicanSofa.config.admin_route_prefix.blank?
    
    scope :controller => :cms_content do
      get 'cms-css/:site_id/:identifier' => :render_css,  :as => 'cms_css'
      get 'cms-js/:site_id/:identifier'  => :render_js,   :as => 'cms_js'
      
      if ComfortableMexicanSofa.config.enable_sitemap
        get '(:cms_path)/sitemap' => :render_sitemap,
          :as           => 'cms_sitemap',
          :constraints  => {:format => /xml/},
          :format       => :xml
      end
      
      get '/' => :render_html,  :as => 'cms_html',  :path => "(*cms_path)"
    end
    # End ComfortableMexicanSofa

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
