class AddDetailsToSubscriber < ActiveRecord::Migration
  def change
    add_column :subscribers, :phone_number, :string
    add_column :subscribers, :fax_number, :string
  end
end
