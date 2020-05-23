# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    @user = User.find_by!(email: params[:email])
    if @user.authenticate(params[:password])
      payload = { user_id: @user.id }
      session = JWTSessions::Session.new(payload: payload)
      render json: session.login.merge({ role: 'admin' })
    else
      render json: 'Invalid user', status: :unauthorized
    end
  end
end
