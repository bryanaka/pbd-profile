class AddOrderToScientistTitles < ActiveRecord::Migration
  def change
    add_column :scientist_titles, :order, :integer
  end
end
