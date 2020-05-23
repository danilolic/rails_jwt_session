# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    @user = User.find_by!(email: params[:email])
    if @user.authenticate(params[:password])
      @session = JWTSessions::Session.new(payload: create_payload(@user))
      render json: @session.login
    else
      render json: 'Invalid user', status: :unauthorized
    end
  end

  private

  def create_payload(user)
    { user_id: user.id, role: 'admin' }
  end
end
