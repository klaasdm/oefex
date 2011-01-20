class AddPicToShowRooms < ActiveRecord::Migration
  def self.up
    add_column :show_rooms, :pic_file_name, :string
    add_column :show_rooms, :pic_content_type, :string
    add_column :show_rooms, :pic_file_size, :integer
    add_column :show_rooms, :pic_updated_at, :datetime
  end

  def self.down
    remove_column :show_rooms, :pic_updated_at
    remove_column :show_rooms, :pic_file_size
    remove_column :show_rooms, :pic_content_type
    remove_column :show_rooms, :pic_file_name
  end
end
