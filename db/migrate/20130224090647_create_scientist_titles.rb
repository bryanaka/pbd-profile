class CreateScientistTitles < ActiveRecord::Migration
  def change
    create_table :scientist_titles do |t|
      t.string :title
      t.integer :scientist_id
    end
  end
end
