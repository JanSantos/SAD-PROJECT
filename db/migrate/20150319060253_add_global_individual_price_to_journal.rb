class AddGlobalIndividualPriceToJournal < ActiveRecord::Migration
  def change
    add_column :journals, :global_individual_price, :decimal
  end
end
