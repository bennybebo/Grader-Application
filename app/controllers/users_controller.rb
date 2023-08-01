class UsersController < ApplicationController
    def destroy
      @user = User.find(params[:id])
      if @user.destroy
        flash[:success] = "User was successfully removed."
      else
        flash[:error] = "Failed to remove the user."
      end
      redirect_to approval_page_path
    end
  end