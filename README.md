# rails
Basic architecture for Ruby on Rails framework + Vue.js

Includes Auth, registration, internalization, chatting rooms and my file's upload/management   
Everywhere 3 languages supported (english, russian, ukranian)

ActionCable and broadcasting used for chat rooms with combination of vue.js frontend   
ActiveStorage with immediate uploads used for user avatars   
DropZone, Carrierwave used for mass files uploads and image processing   
ActiveJob and Sidekiq used for video processing   
Redis Caching used in User files controller

Many integration and system tests included with Minitest, Capybara and Selenium   

## Installation

It is pure project w/o rails kernel libraries.   
To install enviroment use https://github.com/MaximMonin/rails-docker project and copy files to rails-docker ./app catalog.   
1. Rename .env-example to .env and edit mail and sms settings    
2. run start.sh to run containers with rails application   
3. Run run_shell.sh to enter inside container and execute rails db:migrate   
