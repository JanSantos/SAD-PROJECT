class AddAmountDueToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :amount_due, :decimal
  end
end
