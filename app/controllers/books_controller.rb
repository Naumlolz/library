class BooksController < ApplicationController
  BOOKS_PER_PAGE = 6
  
  def index
    @page = params.fetch(:page, 0).to_i
    @books = Book.offset(@page * BOOKS_PER_PAGE).limit(BOOKS_PER_PAGE)
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