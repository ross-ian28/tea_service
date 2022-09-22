Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "/subscribe", to: "subscription#create"
      get "/subscriptions", to: "subscription#index"
      patch "/subscribe/cancel", to: "subscription#update"
    end
  end
end
