class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_up_path_for(resource)
    case resource
    when Customer
      customers_path
    end
  end
  
  def after_sign_in_path_for(resource)
    case resource
    when Customer
      customers_path
    end
  end
 
 
  def after_sign_out_path_for(resource)
    case resource
    when :admin 
      new_admin_session_path
    when :customer
      root_path
    end
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :given_name, :family_name_kana, :given_name_kana, :email, :postcode, :address, :phone_number])
  end
end
