class MembersController < CrudController::Base
    def new 
        @object = Member.new
    end
    def create 
        @object = Member.new(member_params)
        if @object.save 
            flash[:success] = "#{model} saved succesfully."
            redirect_to members_path
        else
            flash[:warning] = "The #{model} could not be saved."
            render :new
        end
    end

    private
    def member_params
        params.require(:member).permit(:fName, :lName, :sex, :DOB, :address, :dateJoined)
    end
        
end