class VideosController < CrudController::Base
    def new 
        @video = Video.new
    end
    def create 
        @video = Video.new(video_params)
        if @video.save 
            redirect_to q1_path
        else
            render 'new'
        end
    end 
    private
    def video_params
        params.require(:video).permit(:title, :certificate, :category, :dailyRental, :price, :director_id) 
    end
end