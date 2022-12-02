Rails.application.routes.draw do
  resources :users, only: [] do
    member do
      post :clock_in
      post :follow
    end
  end
end
