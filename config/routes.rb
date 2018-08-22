Rails.application.routes.draw do
  # get 'students/index'
  root to: 'pages#home'
  devise_for :users
  resources :users, only: [:index, :show]
  resources :students
  resources :lessons
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
