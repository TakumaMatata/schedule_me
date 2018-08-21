Rails.application.routes.draw do
  # get 'students/index'
  devise_for :users
  root to: 'pages#home'
  resources :students
  resources :user, only: [:index, :show] do
    resources :lessons
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
