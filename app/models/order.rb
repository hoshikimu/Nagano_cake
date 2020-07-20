class Order < ApplicationRecord
  belongs_to :member
  has_many :order_items, dependent: :destroy

#中間テーブルを介して複数のプロダクトを持つ
  has_many :items, :through => :order_items
end
