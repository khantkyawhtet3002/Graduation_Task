class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :full_name])
    end

  private

  def after_sign_in_path_for(resource_or_scope)
    if maker_signed_in?
      maker_path(id: current_maker.id)
    elsif
      customer_path(id: current_customer.id)
    end
  end

end
