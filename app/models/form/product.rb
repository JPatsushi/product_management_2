class Form::Product < Product
  #REGISTRABLE_ATTRIBUTES = %i(code name name_kana price purchase_cost availability)
  has_many :product_categories, class_name: 'Form::ProductCategory'
  
  #1.5
  # REGISTRABLE_RELATIONS = [category_ids: []]

  # def selectable_categories
  #   Category.all
  # end
  
  #1.6
  REGISTRABLE_ATTRIBUTES = %i(
    name
    arrival_date
    # arrival_date(1i) arrival_date(2i) arrival_date(3i)
    published_at(1i) published_at(2i) published_at(3i)
    published_at(4i) published_at(5i)
  )
end

