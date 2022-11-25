Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do 
    namespace :v1 do 
      resources :pharmacies do 
        collection do 
          # 星期及特定時間搜尋有營業的藥局
          get :open_at_day
          get :day_of_week
        end

        member do
          # 搜尋特定藥局所販售的口罩
          get :get_masks
        end
      end

      resources :masks do 
      end

      resources :transaction do
      end
    end
  end

end
