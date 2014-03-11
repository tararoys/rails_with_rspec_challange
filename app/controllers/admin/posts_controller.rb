class Admin::PostsController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret"

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Post was successfully saved."
      redirect_to admin_post_url(@post)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to admin_post_url(@post)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:destroy])
    post.destroy

    redirect_to admin_posts_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :is_published)
  end
end