class Admin::OrdersController < ApplicationController
	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
		@order_details = @order.order_details
		@total = @order_details.sum(&:subtotal)
	end

	def update
		@status = Order.find(params[:id])
		@status.update(status_params)
		if  params[:order][:status] == "confirm"
			@statuses = @status.order_details
			@statuses.each do |status|
				OrderDetail.update(
					making_status: 1
					)
			end
		end
		redirect_to admin_order_path(@status)
	end

	private

	def status_params
		params.require(:order).permit(:status)
	end
end
