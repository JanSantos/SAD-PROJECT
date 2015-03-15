class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer :journal_id
      t.integer :volume_number
      t.integer :issue_number
      t.date :date_published

      t.timestamps null: false
    end
  end
end
