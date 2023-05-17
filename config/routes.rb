Rails.application.routes.draw do

  devise_for :admin

    # 顧客用
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions:      "public/sessions"
  }

  scope module: :public do
    root to:             "homes#top"
    get "about" => "homes#about", as: "about"

    resources :items, only: [:index, :show]

    resource :customers, only: [:show, :update]
    get    "customers/information/edit" => "customers#edit",        as: "edit"
    get    "customers/unsubscribe"      => "customers#unsubscribe", as: "unsubscribe"
    patch  "customers/withdraw"         => "customers#withdraw",    as: "withdraw"

    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete "cart_items/destroy_all" => "cart_items#destroy_all", as: "destroy_all"

    resources :orders, only: [:new, :index, :create, :show]
    post   "orders/confirm"  => "orders#confirm",  as: "confirm"
    get    "orders/complete" => "orders#complete", as: "complete"

    resources :destinations, only: [:index, :edit, :create, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
