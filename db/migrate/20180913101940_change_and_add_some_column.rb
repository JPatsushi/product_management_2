class ChangeAndAddSomeColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :time_infos, :must_work_time, :string
    remove_column :time_infos, :sd_work_time, :string
    add_column :time_infos, :must_work_time, :datetime
    add_column :time_infos, :sd_work_time, :datetime
    add_column :users, :depart, :string
    add_column :time_cards, :remark, :string
  end
end
