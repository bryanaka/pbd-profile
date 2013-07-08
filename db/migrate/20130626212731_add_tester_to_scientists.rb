class AddTesterToScientists < ActiveRecord::Migration
  def change
  	add_column :scientists, :tester, :boolean, :default => false
  end
end
