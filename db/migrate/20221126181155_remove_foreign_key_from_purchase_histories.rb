class RemoveForeignKeyFromPurchaseHistories < ActiveRecord::Migration[6.1]
  def change
    remove_column :purchase_histories, :mask_id
    remove_column :purchase_histories, :pharmacy_id
  end
end
