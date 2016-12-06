class CommentsController < ApplicationController

  def index
    comments = Comment.comments_for_user_id(params[:user_id])
    render json: comments
  end

  private

  def comment_params
    params
      .require(:comment)
      .permit(:title, :body, :author_id, :commentable_id, :commentable_type)
  end
end
