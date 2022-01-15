class CommentsController < ApplicationController
  def create
    @comment = Comment.new(
      body: params[:body],
      user_id: current_user.id,
      book_id: params[:id]
    )
    if @comment.save
      redirect_to book_path(id: params[:id])
    else
      @errors = @comment.errors.full_messages
      redirect_to book_path(id: params[:id])
    end
  end

  def destroy
    Comment.destroy(params[:id])
    redirect_to book_path(id: params[:book_id])
  end
end