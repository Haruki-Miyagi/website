class CommentsController < ApplicationController
  before_action :reset_post

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      respond_to do |format|
        format.html { flash[:success] = 'You commented on this post!'
                      redirect_to root_path }
        format.js
      end
    else
      flash[:alert] = 'Check the comment form, something went horribly wrong.'
      render posts_path(@post)
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { flash[:success] = 'Comment deleted :('
                    redirect_to root_path }
      format.js
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end

    def reset_post
      @post = Post.find(params[:post_id])
    end
end
