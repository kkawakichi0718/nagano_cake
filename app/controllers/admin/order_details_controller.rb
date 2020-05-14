class Admin::OrderDetailsController < ApplicationController
	def update
		@order_detail = OrderDetail.find(params[:id])
		@order = @order_detail.order
		@order_detail.update(making_status_params)
		if  params[:order_detail][:making_status] == "started"
            Order.update(
                status: 2
            	)
        end

        if  params[:order_detail][:making_status] == "completed"
        	@completed_status_count = OrderDetail.where(making_status: 3).count
			if @completed_status_count == @order.order_details.count
				Order.update(
                    status: 3
					)
            end
		end
		redirect_to admin_order_path(@order)
	end

	private

	def making_status_params
		params.require(:order_detail).permit(:making_status)
	end
end
