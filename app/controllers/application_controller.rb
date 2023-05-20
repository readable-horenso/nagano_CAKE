class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_admin!, if: :admin_url
  
   # Bootstrapでフラッシュメッセージ
  add_flash_types :success, :info, :warning, :danger
  
  private
  
  def after_sign_up_path_for(resource)
    case resource
    when Customer
      customers_path
    end
  end
  
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
        admin_root_path
    else
        root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :customer
        root_path
    elsif resource_or_scope == :admin
        new_admin_session_path
    else
        root_path
    end
  end
  
  def admin_url
    request.fullpath.include?("/admin")
  end

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :given_name, :family_name_kana, :given_name_kana, :email, :postcode, :address, :phone_number])
  end
  
end
