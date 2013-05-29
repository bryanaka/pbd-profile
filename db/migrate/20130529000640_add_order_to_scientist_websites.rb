class AddOrderToScientistWebsites < ActiveRecord::Migration
  def change
    add_column :scientist_websites, :order, :integer
  end
end
