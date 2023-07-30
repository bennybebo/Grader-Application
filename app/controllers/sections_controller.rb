class SectionsController < ApplicationController
    def index
        @sections = Section.all
    end

    def update
        @section = Section.find(params[:id])
        if @section.update(section_params)
          respond_to do |format|
            format.html { redirect_to @section, notice: 'Graders needed was successfully updated.' }
            format.json { render :show, status: :ok, location: @section }
          end
        else
          respond_to do |format|
            format.html { render :edit }
            format.json { render json: @section.errors, status: :unprocessable_entity }
          end
        end
    end

    def section_params
        params.require(:section).permit(:graders_needed)
    end
end