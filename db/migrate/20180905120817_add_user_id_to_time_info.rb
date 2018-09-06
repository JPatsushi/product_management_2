class AddUserIdToTimeInfo < ActiveRecord::Migration[5.1]
  def change
    add_column :time_infos, :user_id, :integer
  end
end
