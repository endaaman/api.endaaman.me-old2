Rails.application.routes.draw do

  namespace :memos, defaults: { format: :json } do
    get '/', action: 'index'
    post '/', action: 'create'
    patch '/:id', action: 'update'
    delete '/:id', action: 'destroy'
  end

  namespace :users, defaults: { format: :json } do
    get '/', action: 'index'
  end

  constraints filename: /.*/ do
    namespace :files, defaults: { format: :json } do
      get '/', action: 'index'
      post '/', action: 'create'
      post '/rename', action: 'rename'
      delete '/:filename', action: 'destroy'
    end
  end

  namespace :session, defaults: { format: :json } do
    get '/', action: 'index'
    post '/', action: 'create'
  end
end
