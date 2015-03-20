class AddLocalityToSubscriber < ActiveRecord::Migration
  def change
    add_column :subscribers, :locality, :string
  end
end
