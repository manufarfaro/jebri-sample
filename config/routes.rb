Rails.application.routes.draw do
  namespace :api do
    get 'product_families/index'
  end

#  mount_devise_token_auth_for 'User', at: 'auth'

  devise_for :users, :skip => [:session, :registration, :password]
  as :user do
    get '/login' => 'devise/sessions#new', as: :new_user_session
    post '/login' => 'devise/sessions#create', as: :user_session
    delete '/logout' => 'devise/sessions#destroy', as: :destroy_user_session
    post '/user/password' => 'devise/passwords#create'
    get '/password/new' => 'devise/passwords#new', as: :new_user_password
    patch '/user/password' => 'devise/passwords#update'
    put '/user/password' => 'devise/passwords#update'
  end

  namespace :net do
    get '/', to: redirect('/net/dashboard')
    resources :states do
      resources :cities
    end
    resources :commerces do
      resources :offices do
        resources :office_phones
      end
    end
    resources :product_families
    resources :products do
      resources :models
    end
    resources :dashboard, only: [:index]
    resources :users do
      collection do
        get '/:id/change_password(.:format)' => 'users#change_password', as: :change_password
        patch '/:id/update_password(.:format)' => 'users#update_password', as: :update_password
      end
    end
  end

  namespace :api, defaults: { format: :json } do
    resources :product_families, only: [:index] do
      collection do
        get '/:id/products' => 'product_families#show_products_by_family_id'
      end
    end

    resources :products, only: [:index] do
      collection do
        get '/:id/models' => 'products#show_models_by_id'
      end
    end

    resources :states, only: [:index, :show] do
      resources :cities, only: [:index, :show]
    end

    resources :offices, only: [:index, :show] do
      resources :office_phones, only: [:index, :show]
    end

    resources :commerces, only: [:index, :show] do
      resources :offices, only: [:index, :show] do
        resources :office_phones, only: [:index, :show]
      end
    end
  end

  root 'home#index'
  scope '/:locale', locale: /es|en/ do
    get 'empresa', to: 'home#index'
    get 'productos', to: 'home#index'
    get 'donde-comprar', to: 'home#index'
  end

  mount ActionCable.server => '/cable'
end

