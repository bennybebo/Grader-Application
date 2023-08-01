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
        @section = Section.find(params[:id])
        if @section.update(section_params)
          respond_to do |format|
            format.html { redirect_to root_path, notice: 'Graders needed was successfully updated.' }
            format.json { render :show, status: :ok, location: @section }
          end
        else
          respond_to do |format|
            format.html { render :edit }
            format.json { render json: @section.errors, status: :unprocessable_entity }
          end
        end
    end

end