class ScientistTitle < ActiveRecord::Base
	belongs_to :scientist

	validates_presence_of :title, :order, :scientist_id
	validates_uniqueness_of :scientist_id
	validates :order, :length => { :minimum => 1, :maximum => 5 }, :numericality => true
end
