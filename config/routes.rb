# frozen_string_literal: true

Rails.application.routes.draw do
  get 'posts', to: 'posts#index'
  get 'posts/new', to: 'posts#new', as: 'post_new'
  get 'posts/:id', to: 'posts#show', as: 'post'
  post 'posts', to: 'posts#create'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
