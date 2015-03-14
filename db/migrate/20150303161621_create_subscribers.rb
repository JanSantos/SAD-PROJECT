class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :username
      t.string :name
      t.string :password
      t.string :subscription_type
      t.string :contact_person
      t.integer :phone_details
      t.integer :fax_details
      t.string :first_address
      t.string :second_address
      t.string :email_address
      t.string :zip_code
      t.integer :subscribed_journals
      t.string :ip_address
      t.string :subscription_status
      

      t.timestamps null: false
    end
  end
end
