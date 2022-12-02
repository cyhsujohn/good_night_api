Rails.application.routes.draw do
  resources :users, only: [] do
    post :clock_in, on: :member
  end
end
