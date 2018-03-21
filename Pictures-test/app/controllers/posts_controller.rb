class PostsController < ApplicationController
before_action :set_post, only: [:show, :edti, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    # @post = Post.new(post_params)
    # if @post.save
    if @post = Post.create(post_params)
      flash[:success] = "Your post has been created!"
      redirect_to posts_path
    else
      flash.now[:alert] = "Your post could not be created! Please check the form"
      render :new
    end
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Your post has been update!"
      redirect_to posts_path
    else
      flash.now[:alert] = "Your post could not be updated! Please check the form"
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Your post has been deleted!"
    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :image)
    end

    def set_post
      @post = Post.find(params[:id])
    end

end
