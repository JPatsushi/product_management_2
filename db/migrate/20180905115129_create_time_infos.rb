class CreateTimeInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :time_infos do |t|
      t.datetime :must_work_time
      t.datetime :sd_work_time

      t.timestamps
    end
  end
end
