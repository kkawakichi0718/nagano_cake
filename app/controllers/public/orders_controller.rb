class Public::OrdersController < ApplicationController
    def confirm
        @order = Order.new(order_params)
        @items = current_end_user.cart_items
        @total = @items.sum(&:subtotal)
        @bill = @total + @order.postage
        @end_user = current_end_user
        if  params[:order][:address_option] == "0"
            @order.delivery_postal_code = @end_user.postal_code
            @order.delivery_address = @end_user.residence_address
            @order.addressee = @end_user.last_name + @end_user.first_name
        elsif params[:order][:address_option] == "1"
            @address = @end_user.addresses.find_by(id:  params[:order][:address_id])
            @order.delivery_postal_code = @address.postal_code
            @order.delivery_address = @address.delivery_address
            @order.addressee = @address.addressee
        elsif params[:order][:address_option] == "2"
            @order.delivery_postal_code = @order.delivery_postal_code
            @order.delivery_address = @order.delivery_address
            @order.addressee = @order.addressee
        end
    end

    def complete
    end

    def new
        @order = Order.new
        @end_user = EndUser.find(current_end_user.id)
    end

    def create
        @order = Order.new(order_confirm_params)
        @order.save
        @items = current_end_user.cart_items
        @items.each do |cart_item|
            OrderDetail.create!(
                number: cart_item.amount,
                item_id: cart_item.item_id,
                order_id: @order.id,
                unit_price: cart_item.item.taxed_price
                )
        end
        redirect_to public_orders_complete_path
    end

    private

    def order_params
        params.require(:order).permit(:payments_method, :address_option, :end_user_id, :delivery_postal_code, :delivery_address, :addressee)
    end

    def order_confirm_params
        params.require(:order).permit(:payments_method, :delivery_postal_code, :delivery_address, :addressee, :end_user_id, :total_price)
    end
end
