Rails.application.routes.draw do

devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


 scope module: :public do
  root to: 'homes#top'
  post 'customers/sign_in' => 'sessions#create', as: 'customer_session_path'
  get 'about' => 'homes#about', as: 'about'
  get 'item/:id' => 'items#show', as: 'item'
  get 'items' => 'items#index', as: 'items'
  resource :items

  delete 'cart_item/destroy_all' => 'cart_items#destroy_all'
  delete 'cart_items/:id' => 'cart_items#destroy', as: 'cart_items_destroy'
  patch 'cart_items/:id' => 'cart_items#update', as: 'cart_items_update'
  resources :cart_items

  get 'customers/information/edit' => 'customers#edit', as: 'edit_customers'
  get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'customer_unsubscribe'
  patch 'customers/update' => 'customers#update', as: 'customer_update'
  patch 'customers/withdrawal' => 'customers#withdrawal', as: 'customer_withdrawal'
  resource :customers, only: [:show]



  post 'orders/confirm' => 'orders#confirm', as: 'orders_confirm'
  get 'orders/complete' => 'orders#complete', as: 'orders_complete'
  resources :orders

  delete 'addresses/:id' => 'addresses#destroy', as: 'addresses_destroy'
  patch 'addresses/:id' => 'addresses#update', as: 'addresses_update'
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]

 end


 namespace :admin do

    root to: 'homes#top'
    patch 'items/:id' => 'items#update', as: 'update_item'


    resources :items

    get 'customers/:id/edit' => 'customers#edit', as: 'edit_customer'
    patch 'customers/:id' => 'customers#update', as: 'update_customer'
    resources :customers

    resources :orders do
    resources :order_details
   end

  end

end
