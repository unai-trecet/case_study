class FixColumnNameForEmployees < ActiveRecord::Migration[5.1]
  def change
    rename_column :employees, :identify, :identify
  end
end
