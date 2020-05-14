class Item < ApplicationRecord
	attachment :image, destroy: false
	validates :name, presence: true
	validates :description, presence: true
	validates :price, presence: true
    belongs_to :genre, optional: true
    has_many :cart_items, dependent: :destroy
    has_many :order_details, dependent: :destroy

	def taxed_price
		(price * 110 /100.0).ceil
	end

	def set_extra_informaton
		{:taxed_price => taxed_price}
	end

	def genre
		return Genre.find_by(id: self.genre_id)
	end

end
