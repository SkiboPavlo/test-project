class Categories::CommentsController < CommentsController
  before_action :set_commentable

  private
    def set_commentable
      @commentable = Category.find(params[:category_id])
    end
end
