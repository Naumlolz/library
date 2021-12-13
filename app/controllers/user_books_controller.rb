class UserBooksController < ApplicationController
  def index
    @users_books = UsersBook.where(user_id: current_user.id)
  end

  def destroy
    UsersBook.destroy(params[:id])
    redirect_to user_books_path
  end
end