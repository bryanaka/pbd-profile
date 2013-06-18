class ScientistProfile < ActiveRecord::Base
  belongs_to :scientist
  #validates_presence_of :company, :department
  validates_presence_of :phone1, :email, :address1, :city, :state, :zip_code, :emphasis
  validates_uniqueness_of :scientist_id, :email

  xss_foliate :except => [:emphasis, :summary]
  xss_foliate :strip => [:emphasis, :summary]
end
