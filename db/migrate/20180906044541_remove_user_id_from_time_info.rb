class RemoveUserIdFromTimeInfo < ActiveRecord::Migration[5.1]
  def change
    remove_column :time_infos, :user_id, :integer
  end
end
