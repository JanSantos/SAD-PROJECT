class AddNumberOfSubscriberToJournal < ActiveRecord::Migration
  def change
    add_column :journals, :number_of_subscriber, :integer, :default => 0

    Journal.reset_column_information
    Journal.find(:all).each do |p|
    	p.update_attribute :number_of_subscriber, p.subscribers.length
  end
end
