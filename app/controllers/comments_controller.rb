class CommentsController < ApplicationController
  def create
    @comment = Comment.new(
      body: params[:body],
      user_id: current_user.id,
      book_id: params[:id]
    )
    redirect_to book_path(id: params[:id]) if @comment.save
  end

  def index
    @comments = Comment.all
  end

  def destroy
    Comment.destroy(params[:id])
    redirect_to book_path(params[:book_id])
  end
end