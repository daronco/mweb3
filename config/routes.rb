Mweb3::Application.routes.draw do

  get "home", :to => "home#show", :as => "home"
  root :to => "frontpage#show"

  # Set locale
  match "locale/set/:id", :to => "locales#set", :as => "set_locale"

  # Devise
  # controllers = { :sessions => "sessions", :registrations => "registrations" }
  paths = { :sign_in => "login", :sign_out => "logout", :sign_up => "signup" }
  devise_for :users, :path_names => paths #, :controllers => controllers
  devise_scope :user do
    get "login", :to => "devise/sessions#new"
    get "logout", :to => "devise/sessions#destroy"
    get "register", :to => "devise/registrations#new"
  end

  scope "/manage" do

    # The unique Site is created in db/seeds and can only be edited
    resource :site, :only => [:edit, :update]

    # bigbluebutton_rails routes
    controllers = { :servers => "webconf_servers", :rooms => "webconf_rooms" }
    bigbluebutton_routes :default, :scope => "webconf",
      :controllers => controllers,
      :as => "bigbluebutton"

  end

  resources :users, :only => :show

  # profiles are automatically created, can only be updated
  # TODO: why not inside resource :users ?
  scope "/users" do
    resource :profile, :only => :update
  end

  # Webconf rooms shortcuts
  match '/webconf/:id',
    :to => 'webconf_rooms#invite',
    :as => "join_webconf"

end
