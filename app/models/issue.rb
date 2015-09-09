class Issue < ActiveRecord::Base
	self.table_name = "issue"
	belongs_to :user
	belongs_to :item
end
