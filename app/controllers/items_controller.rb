class ItemsController < ApplicationController
  before_action :set_title 

  def index
    @items = @title.items.includes(:user)
    @titles = Title.order('created_at ASC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = @title.items.new(item_params)
    @item.save
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:item).merge(user_id: current_user.id)
  end

  def set_title
    @title = Title.find(params[:title_id])
  end
end
