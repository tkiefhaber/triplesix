Triplesix::Application.routes.draw do
  root "pages#home"
  get "home", to: "pages#home", as: "home"
  get ':username', to: 'users#show', as: :user


  devise_for :users

  namespace :admin do
    root "base#index"
    resources :users
  end

end
