Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'browser_session#new'

  get '/profile' => 'users#show'
  get '/auth' => 'users#auth'
  get '/home' => 'users#home', as: :home

  resources :mentors, only: [:new, :create]
end
