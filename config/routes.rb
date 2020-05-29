Rails.application.routes.draw do
  root "spells#index", as: :home
  resources :spells do
    resources :ingredients
  end
end
