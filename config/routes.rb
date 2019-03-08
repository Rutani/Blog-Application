Rails.application.routes.draw do
  root 'blogs#home'
  get 'blogs/notification'
  post 'blogs/notification'
  post 'blogs/myblog'
  get 'change_val/:id', to: 'blogs#change_val', as: 'change_val'
  devise_for :users
  resources :blogs do
  resources :comments
  end
  resources :blogs do
  resources :likes
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
