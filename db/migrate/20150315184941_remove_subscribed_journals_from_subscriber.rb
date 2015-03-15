class RemoveSubscribedJournalsFromSubscriber < ActiveRecord::Migration
  def change
  	remove_column :subscribers, :subscribed_journals
  end
end
