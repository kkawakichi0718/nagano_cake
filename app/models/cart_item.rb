class CartItem < ApplicationRecord

	belongs_to :item, optional: true
	belongs_to :end_user, optional: true


	def item
		return Item.find_by(id: self.item_id)
	end

	def end_user
		return EndUser.find_by(id: self.item_id)
	end

	def subtotal
		item.taxed_price * amount
	end
end
