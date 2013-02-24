class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :category 
      t.string :scientist
      t.text :description
      t.date :date
      t.string :vid_type
      t.string :vid_code
      t.string :poster
      t.integer :views
      t.string :vid_link
      t.integer :scientist_id

      t.timestamps
    end
  end
end
