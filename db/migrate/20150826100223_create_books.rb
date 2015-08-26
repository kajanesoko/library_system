class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books, :primary_key => :item_id do |t|
	t.string :book_authour, :null => false
	t.integer :year_of_publication, :null=> false
	t.text :version, :null => false
	t.string :publisher, :null => false
	t.string :description, :null => true
      t.timestamps
    end
  end
end
