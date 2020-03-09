class GoodsController < ApplicationController
  def create
    @good = current_user.goods.create(content_id: params[:content_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @good = Good.find_by(content_id: params[:content_id], user_id: current_user.id)
    @good.destroy
    redirect_back(fallback_location: root_path)
  end
end
