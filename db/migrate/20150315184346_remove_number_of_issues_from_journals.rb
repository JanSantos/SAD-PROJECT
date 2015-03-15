class RemoveNumberOfIssuesFromJournals < ActiveRecord::Migration
  def change
  	remove_column :journals, :number_of_issues
  end
end
