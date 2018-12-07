class Form::Product < Product
  REGISTRABLE_ATTRIBUTES = %i(code name name_kana price purchase_cost availability)
  has_many :product_categories, class_name: 'Form::ProductCategory'
  
  REGISTRABLE_RELATIONS = [category_ids: []]

  def selectable_categories
    Category.all
  end
end

