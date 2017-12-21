Rails.application.routes.draw do
  devise_for :users
  namespace :user do
    resources :events
    resources :friendships
  end
  get "/user/month", to: "user/events#month"
  get "/user/week", to: "user/events#week"
  get "/user/today", to: "user/events#today"
  root :to => 'application#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
