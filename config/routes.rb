Rails.application.routes.draw do
  resources :user_files
  resources :chat_messages
  resources :chats
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root controller: :welcome, action: :index
  default_url_options :host => ENV['VIRTUAL_HOST']
end
