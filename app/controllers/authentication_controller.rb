# frozen_string_literal: true

class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate

  def authenticate
    token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    json_response(message: Message.login_success, token: token)
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
