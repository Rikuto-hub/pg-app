class TimelinesController < ApplicationController
    def show
        if user_signed_in?
            user_ids = current_user.followings.pluck(:id)
            @languages = Language.where(user_id: user_ids).order(id: :desc)
        end
        @articles = Article.all.order(id: :desc)
    end
end