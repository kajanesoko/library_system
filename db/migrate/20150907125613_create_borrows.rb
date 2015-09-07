class CreateBorrows < ActiveRecord::Migration
  def change
    create_table :borrow, :primary_key => :borrow_id do |t|
    	t.integer :user_id,	:null => false
    	t.integer :item_id, :null => false
    	t.string  :book_type, :null => true
    	t.boolean :approval_status, :null => true
    	t.text	  :reason, :null => true
      t.timestamps
    end
  end
end
