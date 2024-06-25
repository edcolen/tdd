Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  resources :posts do
    resources :comments, only: [:create]
  end
end
