class Order < ApplicationRecord
  belongs_to :customer
  before_validation :setorder_status
  belongs_to :order_status
  has_many  :order_items
  before_save :update_subtotal

  def subtotal
    order_items.collect { |oi| (oi.quantity.to_i * oi.unit_price.to_f) }.sum
  end

  private

    def setorder_status
      self.order_status_id = 1
    end

    def update_subtotal
      self[:subtotal] = subtotal
    end

end
