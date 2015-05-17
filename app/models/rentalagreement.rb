class Rentalagreement < ActiveRecord::Base
	belongs_to :videoforrent
	belongs_to :member

end
