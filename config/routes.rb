Rails.application.routes.draw do

  devise_for :admin

    # 顧客用
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions:      "public/sessions"
  }

  scope module: :public do

    root to:       "homes#top"
    get "about" => "homes#about", as: "about"

    resources :items, only: [:index, :show]

    resource :customers, only: [:show, :update] do
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
