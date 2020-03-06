class TitlesController < ApplicationController
  def index
    @titles = Title.order('created_at ASC')
  end 
end
