Rails.application.routes.draw do
  resources :users, except:[:new, :edit]
  resources :sessions, only:[:create, :destroy]
end
