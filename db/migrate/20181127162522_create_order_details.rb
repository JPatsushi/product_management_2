class CreateOrderDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :product_id, null: false
      t.integer :unit_price, null: false
      t.integer :quantity, null: false
      t.integer :price, null: false
      
      #  id         :integer          not null, primary key
      #  order_id   :integer          not null              # 注文ID
      #  product_id :integer          not null              # 商品ID
      #  unit_price :integer          not null              # 単価
      #  quantity   :integer          not null              # 数量
      #  price      :integer          not null              # 小計
      #  created_at :datetime         not null
      #  updated_at :datetime         not null

      t.timestamps
    end
  end
end
