class CreateShowRooms < ActiveRecord::Migration
  def self.up
    create_table :show_rooms do |t|
      t.integer :user_id, :null => false, :option =>
		"CONSTRAINT fk_showrooms_users REFRENCES users(id)"
      t.string :title
      t.text :description
      t.decimal :price, :precision => 8, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :show_rooms
  end
end
