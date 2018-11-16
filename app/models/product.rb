class Product < ApplicationRecord
  validates :code, presence: true, length: { maximum: 10 }
  validates :name, presence: true, length: { maximum: 50 }
  validates :name_kana, presence: true, length: { maximum: 50 }
  validates :price,
             presence: true,
             numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :purchase_cost,
             presence: true,
             numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :availability, inclusion: { in: [true, false] }
end

class Person
  include ActiveModel::Model
  attr_accessor :permission 
  # attr_accessor :first_name 
  # attr_accessor :last_name
end
