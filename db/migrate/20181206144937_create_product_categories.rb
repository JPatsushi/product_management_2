class CreateProductCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :product_categories do |t|
      t.integer :product_id, null: false
      t.integer :category_id, null: false
      t.timestamps
    end
  end
end

# == Schema Information
#
# Table name: product_categories # 商品カテゴリ
#
#  id          :integer          not null, primary key
#  product_id  :integer          not null              # 商品ID
#  category_id :integer          not null              # カテゴリID
#  created_at  :datetime         not null
#  updated_at  :datetime         not null