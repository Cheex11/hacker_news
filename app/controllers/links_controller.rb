class LinksController < ApplicationController
  def index
    @links = Link.order_by_modified_score
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.create(link_params)
    if @link.save
      @link.update(:score => 0)
      flash[:notice] = "#{@link.title} has been added"
      redirect_to links_path
    else
      render 'links/new.html.erb'
    end
  end

  def update
    @link = Link.find(params[:id])
    @link.update(link_params)
    redirect_to links_path
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to links_path
  end

  private
  def link_params
    params.require(:link).permit(:title, :url, :score)
  end
end
