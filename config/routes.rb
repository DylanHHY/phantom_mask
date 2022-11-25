Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do 
    namespace :v1 do 
      # 修改藥局名稱
      resources :pharmacies do 
        # 搜尋特定藥局所販售的口罩
        get :getMasks
        collection do 
          # 星期及特定時間搜尋有營業的藥局
          post :openAtDay
          get :dayOfWeek
          
          # 透過關鍵字搜尋符合名稱的藥局
          get ':search/:q', action: 'pharmacies#search', as: 'search_pharmacies'
          
          # 透過價錢區間找到的口罩，並找到符合條件的藥局
          get :searchByPriceAndStock

        end
      end
      
      # 修改口罩名稱、價錢，刪除口罩
      resources :masks do 
        collection do
          # 搜尋符合關鍵字的口罩
          get 'search/:q', action: 'masks#search', as: 'search_masks'
        end
      end

      resources :transcation do
        # 找出指定日期範圍內，口罩交易量最高的x位用戶
        post :RankUserByMaskAmount
        # 指定日期範圍內，所有交易總額
        post :TotalValueInDateRange
        # 指定日期範圍內，所有口罩交易量
        post :MaskAmountInDateRange
        # 全部交易量及總額
        post :transcation
      end
    end
  end

end
