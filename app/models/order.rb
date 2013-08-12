class Order < ActiveRecord::Base
	PAYMENT_TYPES = ["Check", "Credit Card", "Purchase Order"]
	validates :name, :email, :address, presence: true
	validates :email,  :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
	validates :pay_type, inclusion: PAYMENT_TYPES

	has_many :line_items, dependent: :destroy

	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end
end