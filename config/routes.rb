Lunchtown::Application.routes.draw do
  scope ENV['RAILS_RELATIVE_URL_ROOT'] || '/' do
    
    devise_for :persons
    resources :person
    root :to => "person#index"
    #get "/", :controller => :person , :action=> :index
    #post "/", :controller =>  :person, :action => :update
  end
end
