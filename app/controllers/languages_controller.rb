class LanguagesController < ApplicationController
    before_action :authenticate_user!, only:[new, :create, :edit, :destroy]
    def index
        @languages = Language.all
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
    def destroy
        
    end
    private
    def language_params
        params.require(:language).permit(:language, :title)
    end
end