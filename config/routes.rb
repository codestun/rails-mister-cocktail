Rails.application.routes.draw do
  resources :cocktails, only: [ :index, :show, :new, :create ] do
    resources :doses, only: [ :new, :create ]
  end
  root 'cocktails#index'
  delete '/doses/:id', to: 'doses#destroy', as: 'dose'
end
