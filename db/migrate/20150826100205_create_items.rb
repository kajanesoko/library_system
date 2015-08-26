class CreateItems < ActiveRecord::Migration
  def change
    create_table :items, :primary_key => :item_id do |t|
	t.string :item_name, :null => false
	t.string :item_category, :null => false

      t.timestamps
    end
  end
end
