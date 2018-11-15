class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :code, null: false, limit: 10
      t.string :name, null: false, limit: 50
      t.string :name_kana, null: false, limit: 50, default: ""
      t.integer :price, null: false
      t.integer :purchase_cost, null: false
      t.boolean :availability, null: false, default: false
      
    #  code          :string(10)       not null                 # 商品コード
    #  name          :string(50)       not null                 # 商品名
    #  name_kana     :string(50)       default(""), not null    # 商品名カナ
    #  price         :integer          not null                 # 商品価格
    #  purchase_cost :integer          not null                 # 仕入原価
    #  availability  :boolean          default(FALSE), not null # 販売可能フラグ


      t.timestamps
    end
  end
end
