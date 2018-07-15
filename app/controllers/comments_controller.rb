class CommentsController < ApplicationController

  def create
    @comment = @commentable.comments.new comment_params
    if @comment.save
      redirect_back fallback_location: root_path, notice: "Your comment was successfully posted"
    else
      redirect_back fallback_location: root_path, notice: "Your comment was not posted"
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:author, :content)
    end
end
