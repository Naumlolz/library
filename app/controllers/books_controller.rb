class BooksController < ApplicationController
  
  def index
    @books = Book.page(params[:page])
  end

  def show
    @user = current_user
    @book = Book.find(params[:id])
    @comments = @book.comments.all
    @comment = @book.comments.build
    @users_books_ids = @user.users_books.pluck(:book_id)
    #@users_books_ids = UsersBook.where(user_id: current_user.id).pluck(:book_id)
  end

  def add
    service = Users::AddService.new(
      user_id: current_user.id,
      book_id: params[:id]
    )
    service.perform
    flash[:success] = 'The book is chosen'
    redirect_to books_path
  rescue ServiceError => e
    flash[:error] = e.message
    redirect_to users_dashboard_path
  end
end

  #pagination with ruby only
  #BOOKS_PER_PAGE = 6
  # def index
  #   @page = params.fetch(:page, 0).to_i
  #   @books = Book.offset(@page * BOOKS_PER_PAGE).limit(BOOKS_PER_PAGE)
  # end