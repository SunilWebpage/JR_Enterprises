class Cart < ApplicationRecord
  belongs_to :product
  belongs_to :user

  def total_price
    quantity * product.price
  end
end
