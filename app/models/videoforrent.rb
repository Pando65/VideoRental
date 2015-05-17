class Videoforrent < ActiveRecord::Base
	belongs_to :video
	has_many :rentalagreements

	def title_copy
  	  video_id.to_s + ' ' + id.to_s
    end

end
