class Pharmacy < ApplicationRecord
  has_one :openong_hours
  has_many :masks
  has_many :purchase_histories

end
