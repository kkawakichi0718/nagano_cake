class Address < ApplicationRecord
	belongs_to :end_user

	def end_user_information
		self.delivery_address + self.postal_code + self.addressee
	end
end
