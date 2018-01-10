Rails.application.routes.draw do
  get 'calendar/show'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  namespace :user do
    resources :event
    resources :friendship
    resources :category, only: [:show, :index]
  end
  authenticated :user do
    root to: 'user/event#new', as: :authenticated_root
  end

  get "/user/calendar/month", to: "user/calendar#month"
  get "/user/calendar/week", to: "user/calendar#week"
  get "/user/calendar/today", to: "user/calendar#today"
  devise_scope :user do
    root to: "user/event#new"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
