class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.string "asset_file_name"
      t.string "asset_content_type"
      t.string "asset_file_size"
      t.datetime "asset_updated_at"
      t.timestamps
  end
end










