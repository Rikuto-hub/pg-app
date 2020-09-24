class ArticlesController < ApplicationController
    before_action :authenticate_user!, only:[:show, :new, :create, :edit, :update, :destroy]
    def index
        @language = Language.find(params[:language_id])
        @articles = @language.articles
    end
    def show
        @language = Language.find(params[:language_id])
        @article = Article.find(params[:id])
    end
    def new
        language = Language.find(params[:language_id])
        @article = language.articles.build
    end
    def create
        language = Language.find(params[:language_id])
        @article = language.articles.build(article_params)
        if @article.save
            redirect_to language_articles_path, notice: 'save'
        else
            flash.now[:error] = 'miss'
            render :new
        end
    end
    def edit
        language = current_user.languages.find(params[:language_id])
        @article = language.articles.find(params[:id])
    end
    def update
        language = current_user.languages.find(params[:language_id])
        @article = language.articles.find(params[:id])
        if @article.update(article_params)
            redirect_to language_article_path(language)
        else
            flash.now[:error] = 'miss'
            render :edit
        end
    end
    def destroy
        language = current_user.languages.find(params[:language_id])
        article = language.articles.find(params[:id])
        article.destroy!
        redirect_to language_articles_path(language), notice: 'delete'
    end
    private
    def article_params
        params.require(:article).permit(:title, :error, :content, :memo, :number, :article_img)
    end
end