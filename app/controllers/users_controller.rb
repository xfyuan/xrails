class UsersController < ApplicationController
  before_action :authenticate_with_token!, only: [:show, :update, :destroy]
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def show
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

  def update
    if @user.update(user_params)
        render json: @user, status: 200
    else
      render json: { errors: @user.errors }, status: 422
    end
  end

  def destroy
    @user.destroy
    # 204
    head :no_content
  end

  private
    def set_user
      @user = current_user
    end

    def user_params
      params.required(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :authentication_token, :info)
    end
end
