class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @category = Category.find params[:category_id]
    @posts = @category.posts
  end

  def show
    @category = Category.find params[:category_id]
    @post = Post.find params[:id]
    @new_comment = @post.comments.build
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    category = Category.find params[:category_id]
    @post = category.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to category_posts_path, notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Post
                    was successfully destroyed.' }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:name, :content, :file, :category_id)
    end
end
