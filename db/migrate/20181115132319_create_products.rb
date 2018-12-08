class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :code, null: false, limit: 10, default: "999999"
      t.string :name, null: false, limit: 50, default: "wwwwww"
      t.string :name_kana, null: false, limit: 50, default: "tststs"
      t.integer :price, null: false, default: 50000
      t.integer :purchase_cost, null: false, default: 30000
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
