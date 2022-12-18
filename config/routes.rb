Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  resources :books, only:[:new,:show,:index,:edit,:create,:destroy,:update]
  resources :users, only:[:index,:show,:edit,:create,:update,:new]

  get 'home/about'=> 'homes#about',as:'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
