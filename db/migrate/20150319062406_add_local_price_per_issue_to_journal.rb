class AddLocalPricePerIssueToJournal < ActiveRecord::Migration
  def change
    add_column :journals, :local_price_per_issue, :decimal
  end
end
