class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :eppn
      t.string :name
      t.string :mail
      t.string :picture
      t.boolean :confirmed

      t.timestamps
    end
  end
end
