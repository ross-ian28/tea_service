Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "/subscribe", to: "subscription#create"
      get "/customer/subscriptions", to: "subscription#index"
      patch "/subscribe/cancel", to: "subscription#update"
    end
  end
end
