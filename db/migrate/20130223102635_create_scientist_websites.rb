class CreateScientistWebsites < ActiveRecord::Migration
  def change
    create_table :scientist_websites do |t|
      t.string :name
      t.string :url
      t.string :description
      t.integer :scientist_id

      t.timestamps
    end
  end
end
