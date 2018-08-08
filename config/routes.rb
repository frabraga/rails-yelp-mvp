Rails.application.routes.draw do
  resources :restaurants, except: [:update, :edit, :destroy] do
    resources :reviews, only: [ :new, :create, :index ]
  end

  resources :reviews, only: [ :show, :edit, :update, :destroy ]

  root to: "restaurants#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
