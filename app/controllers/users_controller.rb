class UsersController < ApplicationController
  include BCrypt

  def dashboard; end

  def profile; end

  def update_profile
    updated_user = current_user
    updated_user.update(user_params)
    if updated_user.valid?
      flash[:success] = "Your profile was updated"
      redirect_to users_profile_path
    else
      @errors = updated_user.errors.full_messages
      render "profile"
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :age, :avatar, :gender)
  end

  def change_password; end

  def update_password
    service = Users::UpdatePasswordService.new(
      user:                      current_user,
      old_password:              params[:old_password],
      new_password:              params[:new_password],
      new_password_confirmation: params[:new_password_confirmation]
    )
    service.call
    redirect_to users_dashboard_path
  rescue ServiceError => e
    flash.now[:error] = e.message
    render "change_password"
  end
end
