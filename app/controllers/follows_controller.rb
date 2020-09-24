class FollowsController < ApplicationController
    def index
        
    end
    def show
        user = User.find(params[:account_id])
    end
    def create
        current_user.follow!(params[:account_id])
        render json: {status: 'ok'}
    end
end