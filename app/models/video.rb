class Video < ActiveRecord::Base
  belongs_to :director
  has_many :videoforrent
end
