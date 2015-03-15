class AddNumberOfIssuesToJournals < ActiveRecord::Migration
  def change
    add_column :journals, :number_of_issues, :integer, :default => 0

    Journal.reset_column_information
    Journal.find(:all).each do |p|
    	p.update_attribute :number_of_issues, p.issues.length
  end
end
