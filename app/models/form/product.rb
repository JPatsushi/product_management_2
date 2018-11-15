class Form::Product < Product
  REGISTRABLE_ATTRIBUTES = %i(register code name name_kana price purchase_cost)
  attr_accessor :register
end