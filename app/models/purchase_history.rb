class PurchaseHistory < ApplicationRecord
  belongs_to :user
  belongs_to :pharmacy
  belongs_to :mask
end
