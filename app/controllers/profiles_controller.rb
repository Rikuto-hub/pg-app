class ProfilesController < ApplicationController
    before_action :authenticate_user!
    def show
        @languages = current_user.languages
    end
    def edit
        @profile = current_user.prepare_profile
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
        params.require(:profile).permit(:job, :introduction, :avatar)
    end
end