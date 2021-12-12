class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def add
    service = Users::AddService.new(
      user_id: current_user.id,
      book_id: params[:id]
    )
    service.perform
    flash[:success] = 'The book is chosen'
    redirect_to user_books_path
  rescue ServiceError => e
    flash[:error] = e.message
    redirect_to users_dashboard_path
  end
end