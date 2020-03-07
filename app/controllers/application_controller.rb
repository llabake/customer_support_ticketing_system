# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ResponseHandler
  include ExceptionHandler

  before_action :authorize_request
  attr_reader :current_user

  def authorize_request
    @current_user = AuthorizeApiRequest.new(request.headers).call[:user]
  end
end
