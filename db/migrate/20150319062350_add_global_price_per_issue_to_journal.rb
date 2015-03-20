class AddGlobalPricePerIssueToJournal < ActiveRecord::Migration
  def change
    add_column :journals, :global_price_per_issue, :decimal
  end
end
