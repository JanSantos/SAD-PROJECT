class AddLocalIndividualPriceToJournal < ActiveRecord::Migration
  def change
    add_column :journals, :local_individual_price, :decimal
  end
end
