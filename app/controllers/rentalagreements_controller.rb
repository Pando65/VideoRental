class RentalagreementsController < CrudController::Base
before_action :videos, only: [:new, :edit, :update, :create]
 
 def videos
    @videos = Video.all
  end

end