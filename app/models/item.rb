class Item < ActiveRecord::Base
	self.table_name = "item"
	has_one :issue
	has_one :borrow
	belongs_to :item_category
end
