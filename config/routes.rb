Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    get '/' => 'homes#top', as: 'top'
    resources :orders, only: [:show]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end


  scope module: :public do
    root to: 'homes#top'
    get 'homes/top' => 'homes#top'
    get 'homes/about' => 'homes#about', as: 'about'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all'
    post 'cart_items/create' => 'cart_items#create'
    resources :cart_items, only: [:index, :update, :destroy]

    resources :items, only: [:index, :show]
    get  "orders/confirm" => redirect("orders/new")
    post 'orders/confirm' => 'orders#confirm', as: 'confirm'
    get 'orders/complete' => 'orders#complete', as: 'complete'
    resources :orders, only: [:new, :create, :index, :show]
    get 'customers/confirm' => 'customers#confirm'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'
    resource :customers, only: [:edit, :update, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
