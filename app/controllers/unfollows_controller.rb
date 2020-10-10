class UnfollowsController < ApplicationController
    before_action :authenticate_user!
    def index
        user = User.find(params[:account_id])
        @followers = user.followers
    end
    def create
        current_user.unfollow!(params[:account_id])
        render json: {status: 'ok'}
    end
end