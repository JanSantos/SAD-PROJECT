class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :journal_id
      t.integer :subscriber_id
      t.date :subscription_date
      t.integer :years_of_subscription

      t.timestamps null: false
    end
  end
end
