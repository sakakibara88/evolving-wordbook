Rails.application.routes.draw do
  devise_for :users
  root "titles#index"
  
  resources :titles, only: [:index, :new, :create] do
    resources :items, only: [:index, :new, :create ,:show]do
      get "content(.:format)", to: "contents#search_show", as: :content_search
      resources :contents, only: [:index, :create] do
        resources :goods, only: [:create, :destroy]
      end
    end
  end
  resources :items, only: :index do
    collection do
      get 'search'
    end
  end

end
