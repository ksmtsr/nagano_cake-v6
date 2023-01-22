class Address < ApplicationRecord

  belongs_to :customer

  def address_display
  '〒' + postal_code + ' ' + receiver_address + ' ' + name
  end

end
