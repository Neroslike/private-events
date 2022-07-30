Rails.application.routes.draw do
  root to: "events#index"
  resources :events
  resources :event_attendees
  devise_for :users
  get 'users/:id', to: 'users#show', as: :user
  post '/events/:id', to: 'event_attendees#create', as: 'create_attending_event'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
