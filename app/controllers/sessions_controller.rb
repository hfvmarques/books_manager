# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])

    respond_to { |format| @user&.authenticate(params[:password]) ? do_success(format) : do_failure(format) }
  end

  def destroy
    session[:user_id] = nil

    redirect_to(login_path)
  end

  private

  def do_success(format)
    session[:user_id] = @user.id

    format.html { redirect_to user_url(@user), notice: t(:successful_login) }
    format.json { render :show, status: :success, location: @user }
  end

  def do_failure(format)
    format.html { render :new, status: :not_found }
    format.json { render json: @user.errors, status: :not_found }
  end
end
