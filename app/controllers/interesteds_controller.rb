class InterestedsController < ApplicationController

  before_action :authenticate_user!

  def create
    @item = Item.find(params[:item_id])
    current_user.interesteds.create(item_id: @item.id)
    @item.update(interest: @item.interest + 1)
    redirect_to item_path(@item)

  end

  def destroy
    @item = Item.find(params[:item_id])
    @interested = current_user.interesteds.find_by(item_id: @item.id)
    @item.update(interest: @item.interest - 1)
    @interested.destroy
    redirect_to item_path(@item)
  end
end
