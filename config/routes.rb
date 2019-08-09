Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users, controllers: { registrations: :registrations }

    root 'events#index'

    resources :events do
      resources :comments, only: [:create, :destroy]
      resources :subscriptions, only: [:create, :destroy]
      resources :photos, only: [:create, :destroy]

      post :show, on: :member
    end

    resources :users, only: [:show, :edit, :update]
  end
end
