class AddDeliveryStatusToSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :delivery_status, :string
  end
end
