class AddColumnsToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :arrival_date, :date, default: Time.current, null: false
    add_column :products, :published_at, :datetime, default: Time.current, null: false
  end
end

# Table name: products # 商品
#
#  id           :integer          not null, primary key
#  name         :string(50)       not null              # 商品名
#  arrival_date :date             not null              # 入荷予定日
#  published_at :datetime         not null              # 公開予定日時
#  created_at   :datetime         not null
#  updated_at   :datetime         not null