class Product < ActiveRecord::Base
	validates :title, :description, :price, :image_url, presence: true
	validates :price, numericality: {greater_then_or_equal_to: 0.01}
	validates :title, uniqueness: true

	has_many :line_items
	has_many :orders, through: :line_items
	before_destroy :ensure_not_referenced_by_any_line_item

def self.latest
    Product.order(:updated_at).last
  end

  private

    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
end
