class AddAncestryToFolders < ActiveRecord::Migration
  def change
    add_column :folders, :ancestry, :string
  end
end


