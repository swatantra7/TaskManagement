Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
    authenticated :user do
      root to: 'works#index'
      resources :works
    end
  end

end
