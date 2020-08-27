Rails.application.routes.draw do
  resources :user_files
  resources :chat_messages
  resources :chats

  devise_for :users, :controllers => {:registrations => "registration"}
  devise_scope :user do
    post '/users/photo'       => "registration#updatephoto"
    post '/users/checkphone'  => "registration#checkphone"
    post '/users/verifyphone' => "registration#verifyphone"
  end 

  get  '/locale/:locale'      => "locale#set"
  get  '/initstore'           => "welcome#initstore"
  post '/upload/local'        => "upload#new"
  post '/upload/local/delete' => "upload#delete"

  root controller: :welcome, action: :index
  default_url_options :host => ENV['VIRTUAL_HOST']

  require 'sidekiq/web'
  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end
end
