Rails.application.routes.draw do

root to: "top#index"

resources :pictures do
  collection do
    post :confirm
  end
end

end
