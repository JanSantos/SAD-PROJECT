class RemoveUsernameFromSubscriber < ActiveRecord::Migration
  def change
  	remove_column :subscribers, :username
  end
end
