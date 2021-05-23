Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #

  namespace :api, type: :json do
    namespace :v1, type: :json do
      resources :minesweeper_solver, only: :index
    end
  end
end
