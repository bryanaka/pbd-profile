class AddActiveToScientists < ActiveRecord::Migration
  def change
  	add_column :scientists, :visible, :boolean, :default => true
  end
end
