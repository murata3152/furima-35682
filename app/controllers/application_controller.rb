class ApplicationController < ActionController::Base
  before_action :basic_auth

  private

  def basic_auth
    autenticate_or_request_with_http_basic do |username, password|
     username == 'murata' && password == '3152'
    end
  end
end 