class MembersController < CrudController::Base
    def new 
        @object = Member.new
    end
    def create 
        @object = Member.new(member_params)
        if @object.save 
            redirect_to members_path
        else
            render 'new'
        end
    end 
    private
    def member_params
        params.require(:member).permit(:fName, :lName, :sex, :DOB, :address, :dateJoined)
    end
        
end