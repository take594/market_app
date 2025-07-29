class AddDeliveryStatusToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :deliveryStatus, :boolean
  end
end
