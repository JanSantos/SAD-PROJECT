Rails.application.routes.draw do
  devise_for :users
root :to => "pages#index"


  resources :journals do

    get "/ongoing", :to => "journals#ongoing", as: :ongoing
    get "/stopped", :to => "journals#stopped", as: :stopped
  	resources :issues
  end
  resources :subscribers do	
  	resources :subscriptions do
  		get "/paid", :to => "subscriptions#paid", as: :paid
  		get "/unpaid", :to => "subscriptions#unpaid", as: :unpaid

      get "/delivered", :to => "subscriptions#delivered", as: :delivered
      get "/undelivered", :to => "subscriptions#undelivered", as: :undelivered

      get "/subscribed", :to => "subscriptions#subscribed", as: :subscribed
      get "/unsubscribed", :to => "subscriptions#unsubscribed", as: :unsubscribed

  	end
  end
  resources :journals_heads
 
end
