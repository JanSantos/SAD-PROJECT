class AddSubscriptionStatusToSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :subscription_status, :string
  end
end
