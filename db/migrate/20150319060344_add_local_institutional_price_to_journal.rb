class AddLocalInstitutionalPriceToJournal < ActiveRecord::Migration
  def change
    add_column :journals, :local_institutional_price, :decimal
  end
end
