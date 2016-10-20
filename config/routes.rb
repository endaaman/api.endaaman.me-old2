Rails.application.routes.draw do
  resources :memos
  resources :users
  resource :session
end
