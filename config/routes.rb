Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
namespace :api do
  namespace :v0 do
    get '/skills',          to: 'skills#index'
    get '/skills/:id',      to: 'skills#show'
    
    get '/experiences',     to: 'experiences#index'
    get '/experiences/:id', to: 'experiences#show'
    
    get '/projects',        to: 'projects#index'
    get '/projects/:id',    to: 'projects#show'
    
    get '/personal_details', to: 'personal_details#index'
  end
end

  # namespace :api do
  #   namespace :v0 do
  #     resources :skills, only: [:index, :show]
  #     resources :experiences, only: [:index, :show]
  #     resources :projects, only: [:index, :show]
  #     resources :personal_details, only: [:index]
  #   end
  # end
end
