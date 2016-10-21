Rails.application.routes.draw do
  resources :memos
  resources :users
  resources :files
  resource :session
end
