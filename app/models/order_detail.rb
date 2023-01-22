class OrderDetail < ApplicationRecord

  enum making_status: { cannot_started: 0, waiting_production: 1, making: 2, complete: 3 }


  belongs_to :order
  belongs_to :item

  def with_tax_price
    (price * 1.1).floor
  end

  def subtotal
    item.with_tax_price * amount
  end

end
