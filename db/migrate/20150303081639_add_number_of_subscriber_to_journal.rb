class AddNumberOfSubscriberToJournal < ActiveRecord::Migration
  def change
    add_column :journals, :number_of_subscriber, :integer
  end
end
