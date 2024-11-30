Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "home#index"
  # Make sure to define POST route for increment_async
  post 'increment_async', to: 'home#increment_async', as: 'increment_async'

end
