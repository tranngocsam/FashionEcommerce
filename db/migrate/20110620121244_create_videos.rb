class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
			t.string :name
			t.string :description
      t.string :movie_content_type
			t.datetime :movie_updated_at
      t.string :movie_file_name
      t.integer :movie_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
