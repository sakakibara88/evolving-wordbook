class ContentsController < ApplicationController
  before_action :set_title 
  
  def index
    @content         = Content.new
    @titles          = Title.all
    @items           = Item.where(items: {title_id: [@title]})
    @contents        = @item.contents.includes(:user).joins(:goods).group(:content_id).order('count(content_id) DESC')
    @contents_ungood = @item.contents.includes(:user)
    @goods           = Good.where(content_id: @contents)
  end

  def create
    @content = @item.contents.new(content_params)
    @content.save
    redirect_to title_item_contents_path(@title, @item)
  end

  def search_show
    @content         = Content.new
    @titles          = Title.all
    @items           = Item.where(items: {title_id: [@title]})
    @contents        = @item.contents.includes(:user).joins(:goods).group(:content_id).order('count(content_id) DESC')
    @contents_ungood = @item.contents.includes(:user)
    @goods           = Good.where(content_id: @contents)
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
