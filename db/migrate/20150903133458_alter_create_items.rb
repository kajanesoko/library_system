class AlterCreateItems < ActiveRecord::Migration
  def up
  	change_table :item do |t|
		t.string :status, :default => ""	
    end
  end
end
