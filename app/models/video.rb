class Video < ActiveRecord::Base
  attr_accessible :date, :description, :poster, :scientist, :title, :vid_code, :vid_link, :vid_type, :views
end
