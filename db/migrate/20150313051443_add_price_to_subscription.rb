class AddPriceToSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :price, :decimal
  end
end
