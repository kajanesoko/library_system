class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals, :primary_key => :item_id do |t|
	t.string :publisher, :null => false
	t.string :author, :null => false
	
      t.timestamps
    end
  end
end
