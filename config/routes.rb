Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do 
    namespace :v1 do 
      resources :pharmacies do 
        collection do 
          get :open_at_day
          get :day_of_week

        end
      end
    end
  end

end
