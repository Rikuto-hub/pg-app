class LanguagesController < ApplicationController
    before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]
    def index
        if user_signed_in?
          @languages = current_user.languages
        else
            redirect_to timeline_path
        end
    end
    def new
        @language = current_user.languages.build
    end
    def create
        @language = current_user.languages.build(language_params)
        if @language.save
            redirect_to languages_path,  notice: 'save'
        else
            flash.now[:error] = 'miss'
            render :new
        end
    end
    def edit
        @language = current_user.languages.find(params[:id])
    end
    def update
        @language = current_user.languages.find(params[:id])
        if @language.update(language_params)
            redirect_to root_path
        else
            flash.now[:error] = 'miss'
            render :edit
        end
    end
    def destroy
        language = current_user.languages.find(params[:id])
        language.destroy!
        redirect_to root_path, notice: 'delete'
    end
    private
    def language_params
        params.require(:language).permit(:language, :title)
    end
end