class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_current_user
    before_action :set_search

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :postal_code, :residence_address, :is_unsubscribed])
    end

    def set_current_user
    @current_user = EndUser.find_by(id: session[:end_user_id])
    end

    def set_search
        @search = Item.ransack(params[:q])
        @search_items = @search.result
    end
end
