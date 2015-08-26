class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues, :primary_key => :issue_id do |t|
	t.integer :user_id, :null => false
	t.integer :item_id, :null => false
	t.date :date_of_issue, :null => false
	t.date :date_of_return, :null => false
	
      t.timestamps
    end
  end
end
