class ServicesController < ApplicationController
    before_action :authenticate_user!
    def edit
        if current_user.profile.present?
            @profile = current_user.prepare_profile
        else 
            redirect_to edit_profile_path
        end
    end
    def update
        @profile = current_user.prepare_profile
        @profile.assign_attributes(profile_params)
        if @profile.save
            redirect_to profile_path, notice: 'update'
        else
            flash.now[:error] = 'miss'
            render :edit
        end
    end
    private
    def profile_params
        params.require(:profile).permit(:job, :introduction, :url, :avatar)
    end
end