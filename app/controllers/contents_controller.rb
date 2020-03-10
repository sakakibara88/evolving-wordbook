class ContentsController < ApplicationController
  before_action :set_title 
  
  def index
    @contents = @item.contents.includes(:user)
    @content  = Content.new
    @titles   = Title.all
    @items    = Item.where(items: {title_id: [@title]})
    @good     = Good.new
    @goods    = Good.where(content_id: @contents)
  end

  def create
    @content = @item.contents.new(content_params)
    @content.save
    redirect_to title_item_contents_path(@title, @item)
  end

  private
  def content_params
    params.require(:content).permit(:content).merge(user_id: current_user.id, item_id: @item)
  end

  def set_title
    @title = Title.find(params[:title_id])
    @item  = Item.find(params[:item_id])
  end
end
