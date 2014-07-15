ScriptEdSchedule::Application.routes.draw do

  root to: "static#index"

  namespace :api, format: false, defaults: {format: 'json'} do

    resources :students, only: [:index, :show]
    resources :classes, only: [:index, :show]

  end
end
