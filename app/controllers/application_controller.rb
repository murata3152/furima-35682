class ApplicationController < ActionController::Base
  before_action :configure_permited_parameters, if: :devise_controller?
  # before_action :basic_auth
  
  
  private

  def configure_permited_parameters
    binding.pry
  devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_details, :first_name_details, :birthday, :email, :encrypted_password])
  end

  # def basic_auth
  #   autenticate_or_request_with_http_basic do |username, password|
  #    username == 'murata' && password == '3152'
  #   end
  # end
end 