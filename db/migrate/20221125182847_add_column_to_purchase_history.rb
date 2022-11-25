class AddColumnToPurchaseHistory < ActiveRecord::Migration[6.1]
  def change
    add_column :purchase_histories, :pharmacy_name, :string
    add_column :purchase_histories, :mask_name, :string
  end
end
