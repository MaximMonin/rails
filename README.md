# rails
Basic architecture for Ruby on Rails framework + Vue.js

Includes Auth, Registration, Internalization, Chatting rooms and My file's Upload/Management   
Everywhere 3 languages supported (english, russian, ukranian)

Devise + Omniauth (with 5 social networks) is used for registration   
ActionCable and Broadcasting used for chat rooms with combination of vue.js frontend   
ActiveStorage with immediate uploads used for user avatars   
DropZone, Carrierwave used for mass files uploads and image processing   
ActiveJob and Sidekiq used for video processing   
Redis Caching used in Userfiles controller   
Postgres Replication with read/write routing to master/replica db implemented   
Database changes with auditing gem   
ActiveSupport:Subscriber and prometheus exporter used for integration with Prometheus and Grafana. Metrics for http controllers, sidekiq server, sql queries included   
ElasticSearch is used to searching messages in chat rooms   

Many Integration and System tests included with Minitest, Capybara and Selenium Hub   

## Installation

It is pure project w/o rails kernel libraries.   
To install enviroment use https://github.com/MaximMonin/rails-docker project and copy files to rails-docker ./app catalog.   
1. Rename .env-example to .env and edit mail and sms settings    
2. run start.sh to run containers with rails application   
3. Run run_shell.sh to enter inside container and execute rails db:migrate   
