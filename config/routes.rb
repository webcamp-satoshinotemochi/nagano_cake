Rails.application.routes.draw do

  devise_for :owner,skip: [:registrations, :passwords] ,controllers: {
  sessions: "owner/sessions"
}

  devise_for :customers,skip: [:passwords,],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  namespace :owner do
    root to: 'homes#top'
    resources :items,except:[:destroy]
    resources :genres,except:[:show,:destroy,:new]
    resources :customers,except:[:new,:destroy]
    resources :orders,only:[:show,:update]
    resources :order_items,only:[:update]
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :items,only:[:index,:show]
    resources :cart_items,except:[:show,:new,:edit]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :orders,except:[:edit]
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/thank' => 'orders#thank'
    resource :customers,only:[:edit,:update]
    get 'customers/mypage' => 'customers#mypage'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :deliveries,except:[:show,:new]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
