class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :project
      t.string :picture

      t.timestamps
    end
    add_index :images, :project_id
  end
end
