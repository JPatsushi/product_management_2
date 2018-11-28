class CreateCorporations < ActiveRecord::Migration[5.1]
  def change
    create_table :corporations do |t|
      
      t.string :name, null: false, limit: 100
      t.string :name_kana, null: false, limit: 100
      
      #  id         :integer          not null, primary key
      #  name       :string(100)      not null              # 名称
      #  name_kana  :string(100)      not null              # 名称カナ
      #  created_at :datetime         not null
      #  updated_at :datetime         not null

      t.timestamps
    end
  end
end
