class Videoforrent < ActiveRecord::Base
	belongs_to :video
	has_many :rentalagreements

	def copyNo_movie
  	  id.to_s + ', ' + video.title
    end

end
