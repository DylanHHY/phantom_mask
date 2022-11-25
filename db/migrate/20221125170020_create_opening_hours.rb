class CreateOpeningHours < ActiveRecord::Migration[6.1]
  def change
    create_table :opening_hours do |t|
      t.string :day
      t.datetime :opening_at
      t.datetime :close_at
      t.belongs_to :pharmacy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
