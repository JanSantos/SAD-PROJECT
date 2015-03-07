class CreateJournalsHeads < ActiveRecord::Migration
  def change
    create_table :journals_heads do |t|
      t.string :email_address
      t.string :password
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.date :username

      t.timestamps null: false
    end
  end
end
