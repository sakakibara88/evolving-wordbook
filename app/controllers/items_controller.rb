class ItemsController < ApplicationController
  before_action :set_title 
  before_action :set_items, only: [:index, :show]

  @@users = []
  @@user  = Hash.new { |h,k| h[k] = {} }
  
  def index
    if @items == [] then                                            #項目に何もなければ！
      redirect_to new_title_item_path(@title)
    elsif @@user[current_user[:id]] == nil                          #ユーザー情報がなければ！
      @@user[current_user[:id]][:page]  = 0
      @@user[current_user[:id]][:title] = @title
      @@users << @@user
      @item                             = @@user[current_user[:id]][:page]
      redirect_to title_item_contents_path(@title, @item)
    elsif @@user[current_user[:id]][:title] == @title then          #タイトルが同じなら

      if @items[@@user[current_user[:id]][:page] + 1]  == nil then  ##次の項目がなければ
        @@user[current_user[:id]][:page]  = 0
        @@user[current_user[:id]][:title] = @title
        @item                             = @items[@@user[current_user[:id]][:page]]
        redirect_to title_item_contents_path(@title, @item)
      else
        @@user[current_user[:id]][:page] += 1                       ##次の項目へ
        @item  = @items[@@user[current_user[:id]][:page]]
        redirect_to title_item_contents_path(@title, @item)
      end
      
    else
      @@user[current_user[:id]][:page]  = 0                        #別の題目を選んだ時、最初の項目へ
      @@user[current_user[:id]][:title] = @title
      @item   = @items[@@user[current_user[:id]][:page]]
      redirect_to title_item_contents_path(@title, @item)
    end
  end 

  def new
    @item = Item.new
  end

  def show
    @@user[current_user[:id]][:page] -= 1             #前の項目へ
    @item  = @items[@@user[current_user[:id]][:page]]
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

  def set_items
    @items = Item.where(items: {title_id: [@title]})
  end
end
