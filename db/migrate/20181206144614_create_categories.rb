class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false, limit: 50
      t.timestamps
    end
  end
end

# == Schema Information
#
# Table name: categories # カテゴリ
#
#  id         :integer          not null, primary key
#  name       :string(50)       not null              # カテゴリ名
#  created_at :datetime         not null
#  updated_at :datetime         not null
