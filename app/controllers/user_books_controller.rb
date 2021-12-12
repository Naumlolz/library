class UserBooksController < ApplicationController
  def index
    @users_books = UsersBook.where(user_id: current_user.id)
  end
end