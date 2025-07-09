class SearchesController < ApplicationController
  def search
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
    @items_page = @q.result(distinct: true).page(params[:page]).per(9)
    render "searches/search_result"
  end
end
