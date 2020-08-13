Rails.application.routes.draw do
  resources :user_files
  resources :chat_messages
  resources :chats
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # basic rails home page (delete after)
  get '/' => "rails/welcome#index"
  root :to => "rails/welcome#index"
end
