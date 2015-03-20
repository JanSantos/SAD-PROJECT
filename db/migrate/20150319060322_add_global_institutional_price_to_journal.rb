class AddGlobalInstitutionalPriceToJournal < ActiveRecord::Migration
  def change
    add_column :journals, :global_institutional_price, :decimal
  end
end
