Rails.application.routes.draw do
  constraints filename: /.*/ do
  # constraints format: // do
  # scope format: false do
    namespace :memos do
      get '/', action: 'index'
      post '/', action: 'create'
      patch '/:id', action: 'update'
      delete '/:id', action: 'delete'
    end

    namespace :users do
      get '/', action: 'index'
    end

    namespace :files do
      get '/', action: 'index'
      post '/', action: 'create'
      post '/rename', action: 'rename'
      delete '/:filename', action: 'delete'
    end
  end

  # resources :files, param: :filename
  resource :session
end
