class GraderApplyController < ApplicationController
    def new
        # @section = Section.find(params[:section_id])
        @application = Application.new
    end
    def create
        @application = Application.new(application_params)
        if @application.save
            redirect_to application_success_path
        else
            render :new
        end
    end

    private

    def application_params
        params.require(:application).permit(:email, :section_id)
    end
end
