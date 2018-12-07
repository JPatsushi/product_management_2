class Form::ProductCategory < ProductCategory
  REGISTRABLE_ATTRIBUTES = %i(id product_id category_id _destroy)
  
  belongs_to :product, class_name: 'Form::Product'

  def selectable_categories
    Category.all
  end
end