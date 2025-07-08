class InterestedsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    current_user.interesteds.create(item_id: @item.id)
    @interested_number = @item.interest + 1
    @item.update(interest: @interested_number)
    redirect_to item_path(@item)

  end

  def destroy
    @item = Item.find(params[:item_id])
    @interested = current_user.interesteds.find_by(item_id: @item.id)
    @interested_number = @item.interest - 1
    @item.update(interest: @interested_number)
    @interested.destroy
    redirect_to item_path(@item)
  end
end
