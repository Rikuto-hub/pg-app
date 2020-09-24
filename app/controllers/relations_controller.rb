class RelationsController < ApplicationController
    def show
        user = User.find(params[:account_id])
        follow_status = current_user.has_followed?(user)
        render json: {hasFollowed: follow_status}
    end
end