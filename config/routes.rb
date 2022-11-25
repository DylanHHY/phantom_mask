Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do 
    namespace :v1 do 
      resources :pharmacies do 
        collection do 
          # 星期及特定時間搜尋有營業的藥局
          post :open_at_day
          get :day_of_week
          
          # 透過關鍵字搜尋符合名稱的藥局
          get ':search/:q', :action => 'search', :as => 'search'
          
          # 透過價錢區間找到的口罩，並找到符合條件的藥局
          get :searchByPriceAndStock

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
