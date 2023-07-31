class SectionsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_section, only: [:edit, :update]

    def new
        @section = Section.new
    end

    def set_section
        @section = Section.find(params[:id])
    end

    def index
        @sections = Section.all
    end

    def edit
        @section = Section.find_by(params[:id])
        render :edit
    end

    def section_params
        params.require(:section).permit(:graders_needed, :graders_assigned)
    end
    
    def update
        @section = Section.find_by(params[:id])
        if @section.update(section_params) #section_params OR section_number: params[:id] OR just params[:id]
          redirect_to @section, notice: 'Section was successfully updated.'
        else
          render :edit
        end
    end

    def set_section
        @section = Section.find_by(section_number: params[:id])
    end
end