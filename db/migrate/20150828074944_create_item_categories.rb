class CreateItemCategories < ActiveRecord::Migration
  def change
    create_table :item_category, :primary_key => :item_category_id do |t|
    	t.string :name, :null => false
    	t.string :cat_description, :null => false 

      t.timestamps
    end
  end
end
