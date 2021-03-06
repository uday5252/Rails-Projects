Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'workouts#index'
  resources :workouts, only: [:show, :create, :new, :edit, :destroy, :update] #display all the routes
end
