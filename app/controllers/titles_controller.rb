class TitlesController < ApplicationController
  def index
    @titles = Title.order('created_at ASC')
  end
  
  def new
    @title = Title.new
  end

  def create
    @title = Title.new(title_params)
    @title.save
    redirect_to root_path
  end

  private
  def title_params
    params.require(:title).permit(:titl)
  end
end
