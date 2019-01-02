Rails.application.routes.draw do

  root to: "top#index"

  resources :pictures do
    collection do
      post :confirm
    end
  end

  resources :sessions, only:[:new, :create, :destroy]

  resources :users do
    collection do
      get :favorite
    end
  end

  resources :favorites, only: [:create, :destroy]

  mount LetterOpenerWeb::Engine, at: "/inbox" if Rails.env.development?

end
