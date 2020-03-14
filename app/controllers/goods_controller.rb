class GoodsController < ApplicationController
  before_action :set_item_title, only: [:create, :destroy]

  def create
    @good            = current_user.goods.create(content_id: params[:content_id])
    @contents        = @item.contents.includes(:user).joins(:goods).group(:id).order('count(content_id) DESC')
    @contents_ungood = @item.contents.includes(:user)
    @items           = Item.where(items: {title_id: [@title]})
    @goods           = Good.where(content_id: @contents)
  end

  def destroy
    @good            = Good.find_by(content_id: params[:content_id], user_id: current_user.id)
    @good.destroy
    @contents        = @item.contents.includes(:user).joins(:goods).group(:id).order('count(content_id) DESC')
    @contents_ungood = @item.contents.includes(:user)
    @items           = Item.where(items: {title_id: [@title]})
    @goods           = Good.where(content_id: @contents)
  end
  
  private

  def set_item_title
    @title = Title.find(params[:title_id])
    @item  = Item.find(params[:item_id])
  end

end
