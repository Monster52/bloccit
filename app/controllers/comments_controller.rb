class CommentsController < ApplicationController
  before_action :require_sign_in
  before_action :authorize_user, only: [:destroy]

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment saved successfully."
      redirect_to @commentable
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    if comment.destroy
      flash[:notice] = "Comment was deleted successfully."
      redirect_to @commentable 
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def authorize_user
    comment = Comment.find(params[:id])
    unless current_user == comment.user || current_user.admin?
      flash[:alert] = "You do not have permission to delete a comment."
      redirect_to @commentable
    end
  end
end
