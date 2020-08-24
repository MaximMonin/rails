Rails.application.routes.draw do
  resources :user_files
  resources :chat_messages
  resources :chats
  devise_for :users, :controllers => {:registrations => "registration"}

  get  '/locale/:locale'      => "locale#set"
  get  '/initstore'           => "welcome#initstore"
  post '/upload/local'        => "upload#new"
  post '/upload/local/delete' => "upload#delete"

  root controller: :welcome, action: :index
  default_url_options :host => ENV['VIRTUAL_HOST']
end
