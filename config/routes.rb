Oefex::Application.routes.draw do


  resources :orders

  resources :line_items

  resources :carts
  resources :ratings

  get "showoff/index"

  resources :show_rooms



  devise_for :users, :path_names => { :sign_up => "register" } 

 root :to => 'showoff#index' , :as => 'showoff'



end
