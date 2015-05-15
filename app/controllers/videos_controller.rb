class VideosController < CrudController::Base
    def new 
        @object = Video.new
    end
    def create 
        @object = Video.new(video_params)
        if @object.save 
            redirect_to videos_path
        else
            render 'new'
        end
    end 
    private
    def video_params
        params.require(:video).permit(:title, :certificate, :category, :dailyRental, :price, :director_id) 
    end
end