Rails.application.routes.draw do
  namespace :memos do
    get "/" , :action => "index"
  end
end
