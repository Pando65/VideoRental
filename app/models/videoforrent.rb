class Videoforrent < ActiveRecord::Base
	belongs_to :video
	has_many :rentalagreements
end
