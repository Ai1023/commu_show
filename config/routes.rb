Rails.application.routes.draw do

  namespace :admin do
    root to: 'homes#top'
    resources :customers, only:[:index, :show, :edit, :update]
    resources :games, only:[:index, :show, :destroy] do
      resources :post_comments, only:[:create, :destroy]
    end
    resources :event_calenders
  end

  scope module: :customer do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    get '/customers/my_page' => 'customers#show'
    get '/customers/information/edit' => 'customers#edit'
    patch '/customers/information' => 'customers#update'
    get '/customers/quit' => 'customers#quit'
    patch '/customers/out' => 'customers#out'
    resources :customers, only:[:show, :edit, :update]
    resources :games do
      member do
        get :followers, :followings
      end
      resources :relationships, only:[:create, :destroy]
      resources :post_comments, only:[:create, :destroy]
      resource :favorites, only:[:create, :destroy]
      resource :join_events, only:[:create, :destroy]
    end
    resources :event_calenders, only:[:index, :show]
  end

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: 'customer/registrations',
  sessions: 'customer/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: 'admin/sessions'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
