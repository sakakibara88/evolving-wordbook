class ItemsController < ApplicationController
  before_action :set_title, except: :search
  before_action :set_items, only: [:index, :show]

  @@users = []
  @@user  = Hash.new { |h,k| h[k] = {} }
  
  def index
    if @items == [] then                                            #項目に何もなければ！
      if user_signed_in?
        redirect_to new_title_item_path(@title)
      else
        redirect_to root_path
      end
      
    elsif @@user[request.remote_ip] == nil                          #IPアドレスの登録がなければ！
      @@user[request.remote_ip][:page]  = 0
      @@user[request.remote_ip][:title] = @title
      @@users << @@user
      @item                             = @@user[request.remote_ip][:page]
      redirect_to title_item_contents_path(@title, @item)

    elsif @@user[request.remote_ip][:title] == @title then          #タイトルが同じなら
      if @items[@@user[request.remote_ip][:page] + 1]  == nil then  ##次の項目がなければ単語を作成
        redirect_to new_title_item_path(@title)
      else
        @@user[request.remote_ip][:page] += 1                       ##次の項目へ
        @item  = @items[@@user[request.remote_ip][:page]]
        redirect_to title_item_contents_path(@title, @item)
      end
      
    else
      @@user[request.remote_ip][:page]  = 0                        #別の題目を選んだ時、最初の項目へ
      @@user[request.remote_ip][:title] = @title
      @item   = @items[@@user[request.remote_ip][:page]]
      redirect_to title_item_contents_path(@title, @item)
    end
  end 

  def new
    @item = Item.new
  end

  def show
    @@user[request.remote_ip][:page] -= 1                          #前の項目へ
    @item  = @items[@@user[request.remote_ip][:page]]
    redirect_to title_item_contents_path(@title, @item)
  end

  def create
    @item = @title.items.new(item_params)
    if @item.save
      redirect_to title_item_contents_path(@title, @item)
    else
      redirect_to new_title_item_path(@title)
    end
  end

  def search
    if params[:keyup] == ""
      @search = "not-search"
      respond_to do |f|
        f.html
        f.json
      end
    else
      @search = Item.search(params[:keyup])
      respond_to do |f|
        f.html
        f.json
      end
    end
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
