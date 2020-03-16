Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'pages#home'
  get 'user_dashboard', to: "pages#user_dashboard"
  get 'agent_dashboard', to: "pages#agent_dashboard"
  patch 'offer/:id/accept', to: "offers#accept", as: :accept_offer
  patch 'offer/:id/reject', to: "offers#reject", as: :reject_offer
  patch 'offer/:id/complete', to: "offers#complete", as: :complete_offer
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :services, only: [:index]
  resources :job_listings do
    resources :offers, only: [:new, :create]
  end

  resources :offers, only: [ ] do
    resources :reviews, only: [:new, :create]
  end

end
