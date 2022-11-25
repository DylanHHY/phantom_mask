class CreatePharmacies < ActiveRecord::Migration[6.1]
  def change
    create_table :pharmacies do |t|
      t.string :name
      t.integer :cash_balance
      t.datetime :opening_at

      t.timestamps
    end
  end
end
