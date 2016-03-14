class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
        render json: @user, status: 201
    else
      render json: { errors: @user.errors }, status: 422
    end
  end

  private
    def user_params
      params.required(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :authentication_token, :info)
    end
end
