class CreateAdresses < ActiveRecord::Migration[5.1]
  def change
    create_table :adresses do |t|
      t.string :street
      t.string :zip_code
      t.timestamps
    end
  end
end
