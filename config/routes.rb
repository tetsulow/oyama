Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'homes#top'
  resources :lists do
    resources :list_comments, only: [:create, :destroy]
  end

  get 'login' => 'sessions#login'
  post 'login' => 'sessions#login'
  delete 'logout' => 'sessions#destroy'

end
