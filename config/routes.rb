Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :events
    resources :friendships
  end

  root :to => 'application#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
