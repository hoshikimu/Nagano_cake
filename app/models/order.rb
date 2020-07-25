class Order < ApplicationRecord
  belongs_to :member
  has_many :order_items, dependent: :destroy

#中間テーブルを介して複数のプロダクトを持つ
  has_many :items, :through => :order_items

#オーダーアイテムを複数追加するためのメソッド
  accepts_nested_attributes_for :order_items

  enum payment_method: [:クレジットカード, :銀行振込]
  enum production_status: [ :着手不可, :製作待ち, :制作中, :製作完了 ]

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :receiver, presence: true
  validates :payment_method, presence: true

end
