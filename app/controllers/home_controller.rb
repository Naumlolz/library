class HomeController < ApplicationController
  def main
    @genres = Genre.all
  end

  def show_genre_books
    @genre_books = Genre.find_by(name: params[:name]).books.page(params[:page])
  end
end