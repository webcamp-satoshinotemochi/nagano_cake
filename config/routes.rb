Rails.application.routes.draw do

  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  devise_for :owner,skip: [:registrations, :passwords] ,controllers: {
  sessions: "owner/sessions"
}

  devise_for :customers,skip: [:passwords,],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
