class ErrorsController < ApplicationController
    def show
        user = User.find(params[:id])
        language_ids = user.languages.pluck(:id)
        @articles = Article.where(language_id: language_ids).order(number: :desc)
    end
end