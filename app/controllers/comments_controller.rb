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
      redirect_to link_path(@link)
    else
      render 'new'
    end
  end

  def edit
    @link = Link.find(params[:link_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @link = Link.find(params[:link_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "Your comment was updated."
      redirect_to link_path(@link)
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Your comment was deleted."
    redirect_to :back
  end

  private
  def comment_params
    params.require(:comment).permit(:description, :link_id)
  end
end
