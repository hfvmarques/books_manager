# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authorized, only: [:show]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to { |format| @user.save ? do_success(format) : do_failure(format) }
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def do_success(format)
    format.html { redirect_to user_url(@user), notice: t(:successful_signup) }
    format.json { render :show, status: :created, location: @user }
  end

  def do_failure(format)
    format.html { render :new, status: :unprocessable_entity }
    format.json { render json: @user.errors, status: :unprocessable_entity }
  end
end
