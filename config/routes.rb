Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'pages#home'
  get 'user_dashboard', to: "pages#user_dashboard"
  get 'agent_dashboard', to: "pages#agent_dashboard"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :services, only: [:index]
  resources :job_listings do
    resources :offers, only: [:new, :create]
  end
end
