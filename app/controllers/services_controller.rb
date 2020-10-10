class ServicesController < ApplicationController
    before_action :authenticate_user!
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
        params.require(:profile).permit(:url)
    end
end