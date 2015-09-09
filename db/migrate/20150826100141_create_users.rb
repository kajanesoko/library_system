class CreateUsers < ActiveRecord::Migration
  def change
    create_table :user, :primary_key => :user_id do |t|

	t.string :username, :null => false
	t.string :firstname, :null=> false
	t.string :lastname, :null=> false
	t.text :password_hash, :null=> false
	t.string :user_role, :null=>false
	t.string :salt

      t.string:username, :null => false
      t.string:firstname, :null=> false
      t.string:lastname, :null=> false
      t.text:password_hash, :null=> false
      t.text:salt, :null=> false
      t.string:user_role, :null=>false


      t.timestamps
    end
  end
end
