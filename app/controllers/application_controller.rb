class ApplicationController < ActionController::Base
  
  # Bootstrapでフラッシュメッセージ
  add_flash_types :success, :info, :warning, :danger
  
end
