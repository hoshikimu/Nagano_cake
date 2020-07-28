class ShippingAddress < ApplicationRecord
  belongs_to :member, optional: true

  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :address, presence: true
  validates :receiver, presence: true
end