class CreateJournalsSubscribers < ActiveRecord::Migration
  def change
  	

    create_table :journals_subscribers, id: false do |t|
    	t.belongs_to :journal, index: true
    	t.belongs_to :subscriber, index: true
    end
  end
end
