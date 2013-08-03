class LineItem < ActiveRecord::Base
	belongs_to :products
	belongs_to :cart
end
