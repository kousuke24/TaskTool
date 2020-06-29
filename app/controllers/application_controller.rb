class ApplicationController < ActionController::Base
  before_filter :authenticate

  def authenticate
    if Rails.env.production?
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['BASIC_AUTH_NAME'] && password == ENV['BASIC_AUTH_PASSWORD']
      end
    end
  end
end
