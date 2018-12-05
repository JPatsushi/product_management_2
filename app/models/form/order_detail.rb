class Form::OrderDetail < OrderDetail
  REGISTRABLE_ATTRIBUTES = %i(id product_id unit_price quantity _destroy)
  belongs_to :order, class_name: 'Form::Order'

  def selectable_products
    Product.all
  end

  def calculate_order_detail_price
    self.price = unit_price * quantity
  rescue
    self.price = 0
  end
end