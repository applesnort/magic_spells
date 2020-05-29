Rails.application.routes.draw do
  get 'doses/new'
  root "spells#index", as: :home
  resources :spells do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: :destroy
end
