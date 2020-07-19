class ShippingAddress < ApplicationRecord
  belongs_to :member, optional: true
end
