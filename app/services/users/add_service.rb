class Users::AddService
  def initialize(params)
    @user_id = params[:user_id]
    @book_id = params[:book_id]
  end

  def perform
    create_user_books
  end

  private

  def create_user_books
    UsersBook.create(
      user_id: @user_id, book_id: @book_id
    )
  end
end