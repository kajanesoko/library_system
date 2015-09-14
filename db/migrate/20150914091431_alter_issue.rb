class AlterIssue < ActiveRecord::Migration
  def up
  	add_column("issue","returned",:boolean,:default=>false)
  end
  def down
  	remove_column("issue","returned")
  end
end
