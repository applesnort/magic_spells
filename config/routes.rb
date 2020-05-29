Rails.application.routes.draw do
  get 'spells/index'
  get 'spells/new'
  get 'spells/create'
  get 'spells/edit'
  get 'spells/update'
  get 'spells/show'
  get 'spells/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
