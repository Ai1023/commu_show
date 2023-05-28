Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: 'customer/registrations',
  sessions: 'customer/sessions'
  }

  # ゲストログイン
  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'customer/sessions#guest_sign_in'
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: 'admin/sessions'
  }

  namespace :admin do
    root to: 'events#index'
    resources :customers, only:[:index, :show, :edit, :update, :destroy]
    resources :events, only:[:show, :index, :edit, :create, :update, :destroy]
    resources :games, only:[:show, :destroy] do
      resources :post_comments, only:[:destroy]
    end
  end

  scope module: :customer do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    get '/customers/my_page' => 'customers#show'
    get '/customers/information/edit' => 'customers#edit'
    patch '/customers/information' => 'customers#update'
    get '/customers/check' => 'customers#check'
    patch '/customers/withdraw' => 'customers#withdraw'
    get 'customers/info/:id' => 'customers#info', as: 'customers_info'
    resources :customers, only:[:index] do
      collection do
        get 'search'
      end
      resource :relationships, only:[:create, :destroy]
      member do
        get :followings, :followers
      end
    end
    resources :games do
      collection do
        get 'index_all'
        get 'search'
      end
      resources :post_comments, only:[:create, :destroy]
      resource :favorites, only:[:create, :destroy]
    end
    resources :events, only:[:index, :show] do
      resource :join_events, only:[:create, :destroy]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
