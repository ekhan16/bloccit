Bloccit::Application.routes.draw do
  devise_for :users
  resources :users, only: [:update]

  resources :topics do
    resources :posts, except: [:index]
    
  resources :posts do
    resources :comments, only: [:index]
  end

get 'about' => 'welcome#about'

root to: 'welcome#index'
end
