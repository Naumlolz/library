class AuthorsController < ApplicationController
  def index
    @author_books = Author.find_by(full_name: params[:full_name]).books.page(params[:page])
  end
end
