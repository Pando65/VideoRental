class Video < ActiveRecord::Base
  belongs_to :director
  has_many :videoforrents
  # has_many :rentalagreements, through: :videoforrents

  def title_copy
  	  title + ' ' + id.to_s
  end

end
