Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :rafles, except: [:new,:edit]
  resources :tickets, except: [:new,:edit]
  get 'rafles/:rafle_id/tickets', to: 'tickets#index_by_rafle'
end
