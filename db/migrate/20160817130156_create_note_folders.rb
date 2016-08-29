class CreateNoteFolders < ActiveRecord::Migration
  def change
    create_table :note_folders do |t|
        t.integer :note_id
        t.integer :folder_id
        t.timestamps
    end
  end
end
