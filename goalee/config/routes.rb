Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :goals, only: [:create, :new, :show, :update, :delete]
  resource :session, only: [:new, :create, :destroy]
end
