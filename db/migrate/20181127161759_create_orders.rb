class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name, null: false, limit: 100 
      t.integer :corporation_id, null: false
      t.integer :price, null: false
      
      #  id             :integer          not null, primary key
      #  name           :string(100)      not null              # 注文名称
      #  corporation_id :integer          not null              # 取引先
      #  price          :integer          not null              # 合計金額
      #  created_at     :datetime         not null
      #  updated_at     :datetime         not null


      t.timestamps
    end
  end
end
