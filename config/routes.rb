Rails.application.routes.draw do
  resources :entries

  root to: 'raffle#index'
end
