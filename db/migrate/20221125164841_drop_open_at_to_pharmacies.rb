class DropOpenAtToPharmacies < ActiveRecord::Migration[6.1]
  def change
    remove_column :pharmacies, :opening_at
  end
end
