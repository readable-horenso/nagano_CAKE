Rails.application.routes.draw do

  get "searches/search" => "searches#search", as: "search"

  scope module: :public do
    resource :customers, only: [:update]
    resources :genres, only: [:show]
  end

    # 顧客用
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions:      "public/sessions"
  }

  scope module: :public do

    root to:       "homes#top"
    get "about" => "homes#about", as: "about"

    resources :items, only: [:index, :show]

    resource :customers, only: [:show] do
      get      "information/edit" => "customers#edit",        as: "edit"
      collection do
        get    "unsubscribe"      => "customers#unsubscribe", as: "unsubscribe"
        patch  "withdraw"         => "customers#withdraw",    as: "withdraw"
      end
    end

    resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete "destroy_all" => "cart_items#destroy_all", as: "destroy_all"
      end
    end

    resources :orders, only: [:new, :index, :create, :show] do
      collection do
        post   "confirm"  => "orders#confirm",  as: "confirm"
        get    "complete" => "orders#complete", as: "complete"
      end
    end

    resources :destinations, only: [:index, :edit, :create, :update, :destroy]

  end

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }


  namespace :admin do
    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, only: [:new, :index, :show, :edit, :create, :update]
    resources :order_details, only: [:update]
    root to: "homes#top"
  end

end