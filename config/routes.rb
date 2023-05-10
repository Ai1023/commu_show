Rails.application.routes.draw do

  namespace :admin do
    get 'event_calenders/new'
    get 'event_calenders/show'
    get 'event_calenders/index'
    get 'event_calenders/edit'
    get 'event_calenders/create'
    get 'event_calenders/update'
    get 'event_calenders/destroy'
  end
  namespace :admin do
    get 'comments/create'
    get 'comments/destroy'
  end
  namespace :admin do
    get 'games/index'
    get 'games/show'
    get 'games/destroy'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :customer do
    get 'join_events/create'
    get 'join_events/destroy'
  end
  namespace :customer do
    get 'event_calenders/index'
    get 'event_calenders/show'
  end
  namespace :customer do
    get 'relationships/create'
    get 'relationships/destroy'
  end
  namespace :customer do
    get 'favorites/create'
    get 'favorites/destroy'
  end
  namespace :customer do
    get 'post_comments/create'
    get 'post_comments/destroy'
  end
  namespace :customer do
    get 'games/new'
    get 'games/show'
    get 'games/edit'
    get 'games/index'
    get 'games/create'
    get 'games/update'
    get 'games/destroy'
  end
  namespace :customer do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/quit'
    get 'customers/out'
  end
  namespace :customer do
    get 'homes/top'
    get 'homes/about'
  end
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
