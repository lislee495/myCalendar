Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  namespace :user do
    resources :event
    resources :friendship
  end
  authenticated :user do
    root to: 'user/event#new', as: :authenticated_root
  end
  get "/user/month", to: "user/event#month"
  get "/user/week", to: "user/event#week"
  get "/user/today", to: "user/event#today"
  devise_scope :user do
    root to: "user/event#new"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
