class OrderDetail < ApplicationRecord
	belongs_to :item
	belongs_to :order
	enum making_status: { cannot: 0, wait: 1, started: 2, completed: 3}

	def subtotal
		unit_price * number
	end
end
