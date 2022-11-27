class UpdateCashBalanceToDecimal < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :cash_balance, :decimal, precision: 6, scale: 2
    change_column :pharmacies, :cash_balance, :decimal, precision: 6, scale: 2
  end
end
