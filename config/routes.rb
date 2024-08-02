Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
 devise_for :users
 resources :users, only: [:show, :edit, :update]
 resources :post_images, only: [:new, :index, :show, :create, :destroy] do
   resource :favorite, only: [:create, :destroy]
   resources :post_comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

root to: "homes#top"
  
  get "/about" =>"homes#about"
  
end
