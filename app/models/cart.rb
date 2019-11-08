class Cart < ApplicationRecord

  has_many :line_items, dependent: :destroy

  def add_product(product)
    current_item = line_items.find_by(product_id: product.id)
    if current_item
      current_item.increment(:quantity)
    else
      current_item = line_items.build(product_id: product.id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  def shipping
    if line_items.count <= 3
      line_items.count * 4
    else
      line_items.count * 2.50
    end
  end

  def final_price
    total_price + shipping
  end


end
