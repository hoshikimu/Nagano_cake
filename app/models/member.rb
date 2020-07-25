class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shipping_addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

# バリデーション
validates :email, presence: true
validates :name_family, presence: true
validates :name_first, presence: true
validates :name_first_kana, presence: true,  format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
validates :name_family_kana, presence: true,  format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}

# numericality => only_integerで整数のみ、
# ０以上１０未満のみ
# ハイフンなしの7桁
validates :postal_code, presence: true, format: {with: /\A\d{7}\z/},
numericality: { only_integer: true }

# 電話番号10桁（固定電話）or11桁（携帯電話）
VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX },
numericality: {only_integer: true,}

  def active_for_authentication?
    super && (self.is_withdrawal_flag == "t" )
  end
end