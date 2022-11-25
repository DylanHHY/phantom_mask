class Mask < ApplicationRecord
  has_many :purchase_histories
  belongs_to :pharmacy
end
