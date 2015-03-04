class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.string :title
      t.string :status
      t.date :publication_date
      t.integer :number_of_issues
      t.decimal :institutional_price
      t.decimal :individual_price
      t.decimal :price_per_issue
      t.integer :number_of_issues

      t.timestamps null: false
    end
  end
end
