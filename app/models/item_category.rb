class ItemCategory < ActiveRecord::Base
	self.table_name = "item_category"

	has_many :item 
end
