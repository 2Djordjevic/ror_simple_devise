Rails.application.routes.draw do
  root 'home#index'

  get 'posts/index'

  devise_for :hosts
  devise_for :guests
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
