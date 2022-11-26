class MaskUpdatePricePrecision < ActiveRecord::Migration[6.1]
  def change
    change_column :masks, :price, :decimal
  end
end
