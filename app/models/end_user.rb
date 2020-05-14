class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :phone_number, presence: true
  validates :postal_code, presence: true
  validates :residence_address, presence: true
  validates :is_unsubscribed, presence: false
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses
  scope :active, -> {where(is_unsubscribed: false)}

  def active_for_authentication?
    super && (self.is_unsubscribed == false)
  end

  def end_user_information
    self.postal_code + self.residence_address + self.last_name + self.first_name
  end

end
