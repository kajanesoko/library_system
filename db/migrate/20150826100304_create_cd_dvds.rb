class CreateCdDvds < ActiveRecord::Migration
  def change
    create_table :cd_dvds, :primary_key => :item_id do |t|
	t.string :cd_publisher, :null => false

      t.timestamps
    end
  end
end
