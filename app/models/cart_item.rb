class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :member

  validates :quantity, presence: true
end
