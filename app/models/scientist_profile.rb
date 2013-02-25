class ScientistProfile < ActiveRecord::Base
  #attr_accessible :address1, :address2, :city, :company, :department, :department_url, :email, :emphasis, :phone1, :phone2, :phone2_type, :prefix, :publications_url, :scientist_id, :state, :summary, :zip_code
  belongs_to :scientist
  validates_presence_of :address1, :city, :company, :department, :email, :emphasis, :phone1, :scientist_id, :state, :zip_code
end
