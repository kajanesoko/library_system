class CreateItems < ActiveRecord::Migration
  def change
    create_table :item, :primary_key => :item_id do |t|
	t.string :item_name, :null => false
	t.integer :item_category_id, :null => false
	t.string :author, :null => true
	t.string :publisher, :null => true
	t.integer :year, :null => true
	t.string :edition, :null => true
	t.string :description, :null => true
	t.string :serial, :null => true
	t.boolean :void, :null => false, :default => false
	t.string :void_reason, :null => true 


      t.timestamps
    end
  end
end
