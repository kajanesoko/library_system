class CreateLaptops < ActiveRecord::Migration
  def change
    create_table :laptops do |t|
      t.string :name
      t.string :serial_number

      t.timestamps
    end
  end
end
