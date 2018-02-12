class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  has_many :store_order_order_items
  has_many :store_orders, through: :store_order_order_items

  def self.sum_quantity
    group(:item_id)
  end

  def self.top_three_items
    item_hash = self.group(:item_id).count
    popular_items = item_hash.sort_by {|key, value| value}.to_h
    ids = popular_items.keys.reverse[0..2]
    ids.map do |id|
      Item.find(id)
    end
  end

  def self.average_quantity
    average(:quantity).to_i
  end

end
