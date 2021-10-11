class CommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = Comment.new(comment_params)
    comment.book_id = book.id
    comment.user_id = current_user.id
    comment.save
    redirect_to request.referer
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
