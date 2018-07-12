Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'server/:id', to: 'demo#server'
  get 'client', to: 'demo#client'
end
