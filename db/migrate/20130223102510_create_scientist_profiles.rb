class CreateScientistProfiles < ActiveRecord::Migration
  def change
    create_table :scientist_profiles do |t|
      t.string :prefix
      t.string :department
      t.string :department_url
      t.string :company
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :phone1
      t.string :phone2_type
      t.string :phone2
      t.string :email
      t.text :summary
      t.text :emphasis
      t.text :location
      t.integer :scientist_id

      t.timestamps
    end
  end
end
