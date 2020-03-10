Rails.application.routes.draw do
  devise_for :users
  root "titles#index"
  
  resources :titles, only: :index do
    resources :items, only: [:index, :new, :create ,:show]do
      resources :contents, only: [:index, :create] do
        resources :goods, only: [:create, :destroy]
      end
    end
  end

end
