class CommentsController < ApplicationController
  before_action :reset_post

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      render root_path
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:success] ="comment delete!!"
    redirect_to root_path
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end

    def reset_post
      @post = Post.find(params[:post_id])
    end
end
