class Public::CartItemsController < ApplicationController
	def index
		@items = CartItem.all
		@total = @items.sum(&:subtotal)
	end

	def create
		@cart_item = CartItem.new(cart_item_params)
		if current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
			existing_item = current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id])
			existing_item.amount += params[:cart_item][:amount].to_i
			updated_num = existing_item.amount
			existing_item.update(amount: updated_num)
			@cart_item = existing_item
		else
		    @cart_item.save
		end
		redirect_to public_cart_items_path
	end

	def update
	end

	def destroy_part
		@cart_item = CartItem.find(params[:id])
		@cart_item.destroy
		redirect_to public_cart_items_path
	end

	def destroy_all
		@cart_items = CartItem.all
		@cart_items.destroy_all
		redirect_to public_cart_items_path
	end

	private

	def cart_item_params
		params.require(:cart_item).permit(:amount, :end_user_id, :item_id)
	end
end
