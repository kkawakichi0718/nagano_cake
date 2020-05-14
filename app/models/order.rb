class Order < ApplicationRecord
    has_many :order_details, dependent: :destroy
	belongs_to :end_user
	enum status: { wait: 0, confirm: 1, started: 2, preparation: 3, completed: 4}
end
