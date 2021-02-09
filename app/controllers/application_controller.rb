class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:nickname,:birth_day,:first_name,:first_name_kana,:family_name,:family_name_kana])
  end
end

