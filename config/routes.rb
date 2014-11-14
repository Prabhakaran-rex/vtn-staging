PurexNew::Application.routes.draw do


  root :to => 'home#index'
  get "taxes/irs_income" => "taxes#irs_income", as: :taxes_income

  get "payouts/create"

  get "dashboard/payouts(/:status)" => "dashboard#payouts", :as => :dashboard_payouts
  get "dashboard(/:detail)" => 'dashboard#index', :as => :dashboard_detail

  post "tags/create" => "tags#create", :as => :annotate
  match "tags/destroy" => "tags#destroy", :as => :destroy_tag, via: [:get, :delete, :post]

  resources :payments, :only => [:create]
  get "/validate_coupon" => "payments#validate_coupon", :as => :validate_coupon, via: [:get]
  get "appraisal_data/create"
  get '/facebook/' => "users#facebook_login", via: [:get]
  match '/users/update_appraiser_status' => "users#update_appraiser_status", :as => :update_appraiser_status, via: [:post, :put]
  get '/users/get_user_by_vendor_token' => 'users#get_user_by_vendor_token'
  
  devise_for :users, :controllers => { :registrations => "registrations"}

  devise_for :appraisers, :controllers => { :registrations => "registrations"}

  devise_for :customers, :controllers => {:omniauth_callbacks => "omniauth_callbacks",  :registrations => "registrations"}

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

    post '/users/save_json_signature' => 'users#save_json_signature', :as => :save_json_signature
    get '/users/new_signature' => 'users#new_signature', :as => :new_signature
    post '/users/save_signature' => 'users#save_signature', :as => :save_signature
    match '/users/crop_signature' => 'users#crop_signature', :as => :crop_signature, via: :all

    get '/users/save_json_avatar' => 'users#save_json_avatar', :as => :save_json_avatar
    get '/users/new_avatar' => 'users#new_avatar', :as => :new_avatar
    post '/users/save_avatar' => 'users#save_avatar', :as => :save_avatar
    match '/users/crop_avatar' => 'users#crop_avatar', :as => :crop_avatar, via: :all

  resources :appraiser_steps
  resources :photos, :only => [:index, :create, :destroy]
  get '/photos/tag/:appraisal_id/:photo_id' => 'photos#tag', :as => :photo_tag
  post '/photos/set_as_default/:appraisal_id/:photo_id' => "photos#set_as_default", :as => :set_default_photo

  get '/appraisals/wizard_photo_upload/:appraisal_id' => 'appraisals#wizard_photo_upload', :as => :wizard_photo_upload, via: [:get]
  get '/appraisals/wizard_categories/:appraisal_id' => 'appraisals#wizard_categories', :as => :wizard_categories, via: [:get]
  match '/appraisals/share' => 'appraisals#share', :as => :share_appraisal, via: [:get, :post]
  get '/appraisals/show_shared/:id' => 'appraisals#show_shared', :as => :show_shared
  resources :appraisals do
    resources :build, controller: 'appraisals/build'
    resources :photos, :only => [:index, :create, :destroy]
    member do
      get 'reply'
      get 'claim'
    end
  end

  resource :appraiser , :controller => "appraiser" do
    resources :skills
  end

  get '/appraisers/submit_application' => 'appraiser#submit_application', :as => :submit_application
  get '/appraisers/get_application_status/:id' => "appraiser#get_application_status", :as => :get_application_status
  match '/appraisers/notify' => "appraiser#notify", :as => :appraisers_notify, via: [:get, :post]

  get '/skills/getRootCategories' => 'skills#getRootCategories'
  resources :classifications
  resources :skills, only: [:index, :create, :destroy]

  get 'contact' => 'contact#new', :as => 'contact'
  post 'contact' => 'contact#create'
  get 'complaint' => 'contact#complaint', :as => 'complaints', :via => :get
  get 'tickets' => 'contact#tickets', :as => :tickets
  get 'ticket' => 'contact#ticket', :as => :new_ticket
  post 'ticket' => 'contact#ticket_create', :as => :ticket_create
  get '/tickets/:id' => "contact#show", :as => :show_ticket

  # Static pages linked from CMS
  get '/home/how' => 'home#how', :as => 'how'
  get '/home/become' => 'home#become', :as => 'become'
  get '/home/privacy' => 'home#privacy', :as => 'privacy'
  get '/home/terms' => 'home#terms', :as => 'terms'
  get '/home/ethics' => 'home#ethics', :as => 'ethics'
  get '/home/determining' => 'home#determining', :as => 'determining'
  get '/home/limiting' => 'home#limiting', :as => 'limiting'
  get '/home/what_makes' => 'home#what_makes', :as => 'what_makes'
  get '/home/cost' => 'home#cost', :as => 'cost'
  get '/home/appraiser_invite' => 'home#appraiser_invite'
  get '/home/fee_schedule' => 'home#fee_schedule'
  get '/home/uspap_compliance' => 'home#uspap_compliance'
  get '/home/appraisal_body_restricteduse_USPAP_compliant_no' => 'home#appraisal_body_restricteduse_USPAP_compliant_no'
  get '/home/appraisal_body_restricteduse_USPAP_compliant_yes' => 'home#appraisal_body_restricteduse_USPAP_compliant_yes'
  get '/home/appraisal_body_summary_forselling_USPAP_compliant_no' => 'home#appraisal_body_summary_forselling_USPAP_compliant_no'
  get '/home/appraisal_body_summary_forselling_USPAP_compliant_yes' => 'home#appraisal_body_summary_forselling_USPAP_compliant_yes'
  get '/home/cost' => 'home#cost'
  get '/home/testimonials' => 'home#testimonials'
  get '/home/affiliate' => 'home#affiliate', :as => 'affiliate'
  get '/home/appraisal_provider_agreement' => 'home#appraisal_provider_agreement', :as => "appraisal_provider_agreement"
  get '/home/using_online_appraisals' => 'home#using_online_appraisals', :as => "using_online_appraisals"
  get '/home/cost_of_appraisals' => 'home#cost_of_appraisals', :as => "cost_of_appraisals"

  post '/appraisals/comment' => "appraisals#comment", :as => :comments
  get '/appraisals/reject/:id' => "appraisals#reject", :as => :appraisal_reject, via: [:all]
  get 'switch_user' => 'switch_user#set_current_user', via: [:all]
  ActiveAdmin.routes(self)

  get '/cms/blog/posts/:slug' => 'home#blog_redirect'
  get '/cms/blog' => 'home#blog_redirect'

  comfy_route :cms_admin, :path => '/admin'

  # Make sure this routeset is defined last
  comfy_route :cms, :path => '/', :sitemap => false
end
