class ArticlesController < ApplicationController
    before_action :authenticate_user!, only:[:show, :new, :create, :edit, :update, :destroy]
    def index
        @language = Language.find(params[:language_id])
        @articles = @language.articles
    end
    def show
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
        
    end
    def update
        
    end
    def destroy
        
    end
    private
    def article_params
        params.require(:article).permit(:title, :error, :content, :memo, :number)
    end
end