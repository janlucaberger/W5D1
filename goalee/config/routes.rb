Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :goals, only: [:create, :new, :show, :update, :delete]
  resources :user_comments, only: [:create]
  resources :goal_comments, only: [:create]
  resource :session, only: [:new, :create, :destroy]
end
