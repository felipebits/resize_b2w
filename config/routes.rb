Rails.application.routes.draw do
  #root to: proc { [{}, {}, ["<h1>Not Found</h1>"]] }
  #root to: 'pages#index'
  root to: 'images#index'
  resources :images, only: :index do
    post :update_all, on: :collection
  end
end
