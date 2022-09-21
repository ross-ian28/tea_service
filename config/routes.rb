Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "/subscribe", to: "subscription#create"
    end
  end
end
