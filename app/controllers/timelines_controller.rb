class TimelinesController < ApplicationController
    def show
        if user_signed_in?
            user_ids = current_user.followings.pluck(:id)
            @languages = Language.where(user_id: user_ids)
        end
        @articles = Article.all
    end
end