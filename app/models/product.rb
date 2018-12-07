class Product < ApplicationRecord
  has_many :product_categories
  has_many :categories, through: :product_categories
  accepts_nested_attributes_for :product_categories, allow_destroy: true
  
  validates :code, presence: true, length: { maximum: 10 }
  validates :name, presence: true, length: { maximum: 50 }
  validates :name_kana, kana: true, length: { maximum: 50 }
  validates :price,
             presence: true,
             numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :purchase_cost,
             presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :availability, inclusion: { in: [true, false] }
end
