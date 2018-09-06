class ChangeDatatype < ActiveRecord::Migration[5.1]
  def change
    remove_column :time_infos, :must_work_time, :datetime
    remove_column :time_infos, :sd_work_time, :datetime
    add_column :time_infos, :must_work_time, :string
    add_column :time_infos, :sd_work_time, :string
  end
end
