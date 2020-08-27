# rails
Basic architecture for Ruby on Rails framework + Vue.js

Includes Auth, registration, chatting rooms and my file's upload/management   
ActionCable used for chatting with combination of vue.js frontend   
ActiveStorage with immediate uploads used for user avatars   
DropZone, Carrierwave used for mass files uploads and image/video processing   

## Installation

It is pure project w/o rails kernel libraries.   
To install enviroment use https://github.com/MaximMonin/rails-docker project and copy files to rails-docker ./app catalog.   
Run run_shell.sh to enter inside container and execute rails db:migrate   
run start.sh to run containers with rails aplication   
