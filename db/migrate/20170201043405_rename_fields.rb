class RenameFields < ActiveRecord::Migration[5.0]
  def change
    rename_column :recurrences, :frequency_code, :repeat_pattern
  end
end
