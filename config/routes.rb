Rails.application.routes.draw do
  get 'ingredients/index'
  get 'ingredients/new'
  get 'ingredients/create'
  get 'ingredients/edit'
  get 'ingredients/update'
  get 'ingredients/show'
  get 'ingredients/destroy'
  root "spells#index", as: :home
  resources :spells
end
