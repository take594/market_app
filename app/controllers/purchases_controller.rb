class PurchasesController < ApplicationController

  before_action :authenticate_user!

  def index
    @purchases = current_user.purchases.page(params[:page]).per(9)
  end

  def new
    @item = Item.find(params[:format])
    @purchase = Purchase.new
  end

  def create
    @purchase = current_user.purchases.build(purchase_params)
    @item = Item.find(@purchase.item_id)
    if @purchase.save
      flash[:notice] = "購入を確定しました"
      @item.update(onSale: false)
      redirect_to root_path
    else
      flash[:notice] = "購入に失敗しました"
      render "new"
    end
  end

  def show
    @purchase = Purchase.find(params[:id])
    @item = @purchase.item
  end

  def edit
    @purchase = Purchase.find(params[:id])
  end

  def update
    @purchase = Purchase.find(params[:id])
    if @purchase.update(arrived_params)
      flash[:notice] = "商品の到着状況を報告しました"
      #購入した商品の出品者の評価を更新
      @user = User.find(@purchase.item.user_id)
      @addRate = @user.likes + @purchase.rate
      @user.update(likes: @addRate)
      redirect_to purchases_path
    else
      render :edit
    end
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @item = @purchase.item
    @purchase.destroy
    flash[:notice] = "購入を取り消しました"
    @item.update(onSale: true)
    redirect_to purchases_path
  end
  
  private
    def purchase_params
      params.require(:purchase).permit(:arrived, :rate, :item_id)
    end

    def arrived_params
      params.require(:purchase).permit(:arrived, :rate)
    end
end
