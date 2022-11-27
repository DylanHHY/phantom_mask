class RemoveIndexFromPurchaseHistories < ActiveRecord::Migration[6.1]
  def change
    remove_index :purchase_histories, :mask_id
  end
end
