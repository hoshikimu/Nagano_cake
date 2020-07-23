class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum production_status: [ :着手不可, :製作待ち, :制作中 , :製作完了 ]

  def full_name
    @member.name_family + @member.name_first
  end
end
