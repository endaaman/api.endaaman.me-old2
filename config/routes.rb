Rails.application.routes.draw do
  namespace :users do
    get "/" , :action => "index"
  end
end
