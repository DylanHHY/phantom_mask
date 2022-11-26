class MaskUpdatePricePrecision2 < ActiveRecord::Migration[6.1]
  def change
    change_column :masks, :price, :decimal, precision: 6, scale: 2
  end
end
