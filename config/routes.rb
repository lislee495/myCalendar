Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions",
                                    omniauth_callbacks: 'users/omniauth_callbacks',
                                    registrations: 'users/registrations' }
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
  get "/user/calendar/day", to: "user/calendar#day"
  post "/user/event/unshare", to: "user/event#unshare"
  post "/user/friendship/create", to: "user/friendship#create"
  devise_scope :user do
    root to: "user/event#new"
  end
  get "*path" => redirect("/")
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
