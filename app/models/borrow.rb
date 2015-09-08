class Borrow < ActiveRecord::Base
	self.table_name = "borrow"
	belongs_to :user
	belongs_to :item
end
