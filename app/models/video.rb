class Video < ActiveRecord::Base
  attr_accessible :description, :poster, :scientist, :title, :vid_code, :vid_link, :vid_type, :views

  def date
    if self[:date] != nil
      newDate = Date.strptime self[:date], '%m/%d/%Y'
    end
  end

end