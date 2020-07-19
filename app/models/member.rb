class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shipping_addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

# バリデーション
validates :name_family, presence: true
validates :name_first, presence: true
validates :name_family_kana, presence: true
validates :name_first_kana, presence: true
validates :email, presence: true
# validates :is_withdrawal_flag, inclusion: { in: [true, false] }
# numericality => only_integerで整数のみ、
# ０以上１０未満のみ
validates :postal_code, presence: true, 
numericality: {
  only_integer: true,
}

validates :phone_number, presence: true, 
numericality: {
  only_integer: true,
}

validates :password, presence: true, length: {minimum: 6}


end
