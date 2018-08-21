Rails.application.routes.draw do
  get 'students/index'
  get 'students/show'
  get 'students/new'
  get 'students/create'
  get 'students/edit'
  get 'students/update'
  get 'students/destroy'
  get 'lessons/index'
  get 'lessons/show'
  get 'lessons/new'
  get 'lessons/create'
  get 'lessons/edit'
  get 'lessons/update'
  get 'lessons/destroy'
  get 'users/index'
  get 'users/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
