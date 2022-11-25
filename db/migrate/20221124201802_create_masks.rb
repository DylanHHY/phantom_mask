class CreateMasks < ActiveRecord::Migration[6.1]
  def change
    create_table :masks do |t|
      t.string :name
      t.integer :price
      t.belongs_to :pharmacy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
