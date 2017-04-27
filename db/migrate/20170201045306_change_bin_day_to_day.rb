class ChangeBinDayToDay < ActiveRecord::Migration[5.0]
  def change
    rename_column :recurrences, :bin_day, :week_day_mask
  end
end
