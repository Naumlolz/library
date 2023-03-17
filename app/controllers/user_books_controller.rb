class UserBooksController < ApplicationController
  def index
    @users_books = UsersBook.where(user_id: current_user.id).page(params[:page])
  end

  def destroy
    UsersBook.destroy(params[:id])
    flash[:success] = "Book was successfully deleted"
    redirect_to user_books_path
  end
end
