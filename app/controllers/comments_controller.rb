class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @link = Link.find(params[:link_id])
  end

  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Your comment has been saved."
      redirect_to links_path
    else
      redirect_to new_link_comment_path(@link)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:description, :link_id)
  end
end
