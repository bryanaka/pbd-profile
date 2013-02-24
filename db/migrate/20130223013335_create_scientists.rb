class CreateScientists < ActiveRecord::Migration
  def change
    create_table :scientists do |t|
      t.string :first_name
      t.string :last_name
      t.string :picture
      t.string :title
      t.string :slug

      t.timestamps
    end
  end
end
