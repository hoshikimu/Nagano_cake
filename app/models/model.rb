class Order < ApplicationRecord
  belongs_to :member
  has_many :order_items, dependent: :destroy

#中間テーブルを介して複数のプロダクトを持つ
  has_many :items, :through => :order_items

#オーダーアイテムを複数追加するためのメソッド
  accepts_nested_attributes_for :order_items

  enum payment_method: [ :クレジットカード, :銀行振込]
  # enum production_status: [ :cannot_start, :Awaiting, :in_the_making , :copleted ]
  enum order_status: [ :入金待ち, :入金確認, :制作中, :発送準備中, :発送済み]

  # @tax = 1.1
  # @tax_included_price = @item.price * @tax

  # @subtotal_price = tax_included_price * quantity

  # @total = @subtotal_price * quantity + postage


end