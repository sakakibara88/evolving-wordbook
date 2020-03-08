class ItemsController < ApplicationController
  before_action :set_title 
  @@nan   = -1
  @@title = 0

  def index
    @items = Item.where(items: {title_id: [@title]})
    if @items == [] then
      redirect_to new_title_item_path(@title)
    
    elsif @@title == @title then
      @@nan += 1
      @item  = @items[@@nan]
      redirect_to title_item_contents_path(@title, @item)
    else
      @@nan   = 0
      @@title = @title
      @item   = @items[@@nan]
      redirect_to title_item_contents_path(@title, @item)
    end
  end 

  def new
    @item = Item.new
  end

  def show
    @items = Item.where(items: {title_id: [@title]})
    @@nan -= 1
    @item  = @items[@@nan]
    redirect_to title_item_contents_path(@title, @item)
  end

  def create
    @item = @title.items.new(item_params)
    @item.save
    redirect_to title_item_contents_path(@title, @item)
  end

  private
  def item_params
    params.require(:item).permit(:item).merge(user_id: current_user.id)
  end

  def set_title
    @title = Title.find(params[:title_id])
  end
end
