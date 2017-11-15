Rails.application.routes.draw do
  devise_for :users, skip: [:registrations, :sessions]
  as :user do
    get "/signup", to: "registrations#new", as: :new_user_registration
    post "/signup", to: "registrations#create", as: :user_registration
    get "/profile", to: "registrations#edit", as: :edit_user_registration
    put "/signup", to: "registrations#update", as: nil
    delete "/signup", to: "registrations#destroy", as: nil
    get "/login", to: "sessions#new", as: :new_user_session
    post "/login", to: "sessions#create", as: :user_session
    delete "/logout", to: "sessions#destroy"
  end

  root "static_pages#index"
end
