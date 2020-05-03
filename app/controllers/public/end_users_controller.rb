class Public::EndUsersController < ApplicationController
	def show
		@user = EndUser.find(current_end_user.id)
	end

	def edit
		@end_user = EndUser.find(current_end_user.id)
	end

	def update
		@end_user = EndUser.find(current_end_user.id)
  	    @end_user.update(user_params)
  	    redirect_to public_end_user_path
	end

	def confirm
	end

	def withdrawal
		@end_user = EndUser.find(current_end_user.id)
		@end_user.update(is_unsubscribed: true)
		reset_session
		redirect_to root_path
	end

	private
    def user_params
    	params.permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :residence_address, :email, :phone_number, :is_unsubscribed)
    end

end
