class Product < ActiveRecord::Base
	validates :title, :description, :price, :image_url, presence: true
	validates :price, numericality: {greater_then_or_equal_to: 0.01}
	validates :title, uniqueness: true

	has_many :line_items

	before_destroy :ensure_not_referenced_by_any_line_item

	private 

	#Переконуємось в відсутності товарнийх позицій, що ссилаються на даний товар
	def ensure_not_referenced_by_any_line_item

		if line_items.empty?
			return true
		else
			errors.add(:base, ' Line item already exist')
		end 

	end
end
