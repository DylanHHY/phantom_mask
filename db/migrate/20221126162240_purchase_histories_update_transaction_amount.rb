class PurchaseHistoriesUpdateTransactionAmount < ActiveRecord::Migration[6.1]
  def change
    change_column :purchase_histories, :transaction_amount, :decimal, precision: 6, scale: 2
  end
end
