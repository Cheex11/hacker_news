class LinksController < ApplicationController
  def index
    @links = Link.all
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

  private
  def link_params
    params.require(:link).permit(:title, :url)
  end
end
