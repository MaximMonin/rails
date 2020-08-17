Rails.application.routes.draw do
  resources :user_files
  resources :chat_messages
  resources :chats
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/locale/:locale' => "locale#set"
  get '/user_files/videos' => "user_files#video"
  get '/user_files/photos' => "user_files#photo"
  get '/user_files/docs'   => "user_files#doc"
  get '/initstore'         => "welcome#initstore"

  root controller: :welcome, action: :index
  default_url_options :host => ENV['VIRTUAL_HOST']
end
