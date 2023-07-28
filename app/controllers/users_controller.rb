class UsersController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_user, only: [:show, :update, :destroy]

  def index
    begin
      @users = User.all
      render json: @users, status: 200
    rescue => e
      render json: e.message, status: 503
    end
  end

  def show
    begin
      render json: @user, status: 200
    rescue => e
      render json: e.message, status: 503
    end
  end

  def create
    begin
      @user = User.new(user_params)
      raise @user.inspect
      if @user.save
        render json: @user, status: 201
      else
        render json: {errors: @user.errors.full_messages}, status: 503
      end
    rescue => e
      render json: e.message, status: 503
    end
  end

  def update
    begin
      if @user.update(user_params)
        render json: @user, status: 201
      end
    rescue => e
      render json: e.message, status: 503
    end
  end

  def destroy
    begin
      if @user.destroy
        render json: {status: 200, message: "user delete successfully"}
      end
    rescue => e
      render json: e.message, status: 503
    end
  end

  private

  def user_params
    params.permit(:user_name, :email, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
