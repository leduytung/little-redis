Rails.application.routes.draw do
  get 'cli', to: 'cli#index'
  post 'cli', to: 'cli#excute'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
