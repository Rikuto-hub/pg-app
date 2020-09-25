class TimelinesController < ApplicationController
    def show
        user_ids = current_user.followings.pluck(:id)
        @languages = Language.where(user_id: user_ids)
        @articles = Article.all
    end
end