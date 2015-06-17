class AddExpirationToSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :expiration_date, :date
  end
end
