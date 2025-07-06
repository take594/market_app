class SearchesController < ApplicationController
  def search
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
    render "searches/search_result"
  end
end
