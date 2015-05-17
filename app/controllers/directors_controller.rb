class DirectorsController < CrudController::Base
    def new 
        @object = Director.new
    end
    def create 
        @object = Director.new(director_params)
        if @object.save 
            flash[:success] = "#{model} saved succesfully."
            redirect_to directors_path
        else
            flash[:warning] = "The #{model} could not be saved."
            render :new
        end
    end 
    private
    def director_params
        params.require(:director).permit(:directorNo, :DirectorName)
    end
    
end