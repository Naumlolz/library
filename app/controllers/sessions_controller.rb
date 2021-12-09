class SessionsController < ApplicationController
  include BCrypt

  def user_sign_in
  end

  def user_perform_sign_in
    @user = User.find_by(email: params[:email])
    if @user.nil?
      @errors = 'The client with this email or password is not found'
      render 'user_sign_in' and return
    end
    hashed_password = BCrypt::Password.new(@user.password)
    
    if hashed_password == params[:password]
      flash[:success] = 'Sign in is successfull!'
      session[:member_type] = 'User'
      session[:member_id] = @user.id
      redirect_to users_dashboard_path
    else
      @errors = 'The client with this email or password is not found'
      render 'user_sign_in'
    end
  end

  def user_sign_up
  end

  def user_perform_sign_up
    @user = User.find_by(email: params[:email])
    if @user.present?
      @errors = 'This email`s already taken'
      render 'user_sign_up' and return
    end

    if params[:password] != params[:password_confirmation]
      @errors = 'The password doesn`t match'
      render 'user_sign_up' and return
    end

    @user = User.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password].present? ? Password.create(params[:password]) : nil
    )
    if @user.valid?
      flash[:success] = 'Thank you for singup! Now you can sign in!'
      redirect_to users_sign_in_path
    else
      @errors = @user.errors.full_messages
      render 'user_sign_up'
    end
  end

  def sign_out
    session[:member_type] = nil
    session[:member_id] = nil
    redirect_to root_path
  end
end