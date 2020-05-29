Rails.application.routes.draw do
  root "spells#index", as: :home
  get 'doses/new'
  resources :spells do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: :destroy
end
