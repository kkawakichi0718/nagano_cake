class Item < ApplicationRecord
	attachment :image, destroy: false
	validates :name, presence: true
	validates :description, presence: true
	validates :price, presence: true

	def taxed_price
		price * 1.1
	end

	def set_extra_informaton
		{:taxed_price => taxed_price}
	end
end
