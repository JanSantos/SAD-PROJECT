Rails.application.routes.draw do
root :to => "pages#index"


  resources :journals
  resources :subscribers
  resources :journals_heads
  
end
