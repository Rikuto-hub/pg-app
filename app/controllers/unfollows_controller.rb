class UnfollowsController < ApplicationController
    def index
        def index
            user = User.find(params[:account_id])
            @followers = user.followers
        end
    end
    def create
        current_user.unfollow!(params[:account_id])
        render json: {status: 'ok'}
    end
end