Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root :to => "animal_types#index"
  resources :animals
  resources :animal_types
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
