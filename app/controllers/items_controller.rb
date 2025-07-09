class ItemsController < ApplicationController
  def index
    @items = current_user.items.page(params[:page]).per(9)
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:notice] = "商品を出品しました"
      redirect_to root_path
    else
      flash[:notice] = "商品の出品に失敗しました"
      render "new"
    end
  end

  def show
    @item = Item.find(params[:id])
    @sold_item = Item.find_by(category: @item.category, onSale: false)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "商品の情報を更新しました"
      redirect_to items_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "商品の出品を取り消しました"
    redirect_to items_path
  end

  def item_params
    params.require(:item).permit(:user_id, :title, :image, :price, :category, :introduction, :onSale, :interest)
  end
end
