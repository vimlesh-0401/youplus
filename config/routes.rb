Rails.application.routes.draw do
    root "application#home"
    resources :drivers, only: [:index]
    resources :customers, only: [:index]
    resources :requests, only: [:create, :index] do
        member do 
            post :rides
        end
    end
    get 'drivers(/:id)', to: 'drivers#rides'
end
