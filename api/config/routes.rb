# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/health_check', to: 'application#health_check'
  get '/routes', to: 'application#routes'
  get '/ask_tip', to: 'application#ask_trainer_tip'
  post '/route/create', to: 'application#create_route'
end
