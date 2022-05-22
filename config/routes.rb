Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'homes#top'
  resources :lists, only: [:new, :create, :index, :show, :edit, :update, :destroy]

end
