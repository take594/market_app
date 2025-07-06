class HomesController < ApplicationController
  before_action :set_search
  def top
  end

  def set_search
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
  end
end
