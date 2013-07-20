class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :images, :picture, :file
  end
end
