Rails.application.routes.draw do

  root 'welcome#index'

  get 'sign-up', to: 'registrations#new'
  post 'sign-up', to: 'registrations#create'
  get 'sign-in', to: 'authentication#new'

resources :user do
  resources :gardens
  end
end
