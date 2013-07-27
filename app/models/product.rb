class Product < ActiveRecord::Base
	validates :title, :description, :price, :image_url, presence: true
	validates :price, numericality: {greater_then_or_equal_to: 0.01}
	validates :title, uniqueness: true
end
