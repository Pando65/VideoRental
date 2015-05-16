class Member < ActiveRecord::Base
	has_many :rentalagreements

 def full_name
    fName + ' ' + lName
  end

end
