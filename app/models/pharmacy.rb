class Pharmacy < ApplicationRecord
  has_many :masks
  has_many :purchase_histories

end
