class CreatePurchaseHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :purchase_histories do |t|
      t.integer :transaction_amount
      t.datetime :transaction_date
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :pharmacy, null: false, foreign_key: true
      t.belongs_to :mask, null: false, foreign_key: true

      t.timestamps
    end
  end
end
