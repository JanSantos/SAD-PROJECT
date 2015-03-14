Rails.application.routes.draw do
  devise_for :users
root :to => "pages#index"


  resources :journals
  resources :subscribers do	
  	resources :subscriptions
  end
  resources :journals_heads
 
end
