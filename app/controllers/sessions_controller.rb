class SessionsController < ApplicationController
  before_action :set_user, only: [:create]

  def create
    if @user.present? && @user.authenticate(user_params[:password])
      refresh_authentication_token! @user
      render json: @user, status: 200
    else
      # 401
      render json: { errors: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def destroy
    user = User.find_by(authentication_token: params[:id])
    refresh_authentication_token! user
    head :no_content
  end

  private
    def set_user
      @user = user_params[:email].present? && User.find_by(email: user_params[:email])
    end

    def user_params
      params.require(:user).permit(:email, :password)
    end

    def refresh_authentication_token!(user)
      user.generate_authentication_token!
      user.update_attribute(:authentication_token, user.authentication_token)
    end
end
