class Public::ItemsController < ApplicationController
	def top
	end

	def index
		@items = Item.all
		@genres = Genre.all
	end

	def show
		@item = Item.find(params[:id])
		@cart_item = CartItem.new
		if end_user_signed_in?
		  @end_user = EndUser.find(current_end_user.id)
		else
		  @end_user = Admin.where(email: 'kawakita@keisuke')
		end
	end

end
