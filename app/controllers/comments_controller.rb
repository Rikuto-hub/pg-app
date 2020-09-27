class CommentsController < ApplicationController
    before_action :authenticate_user!
    def index
        article = Article.find(params[:article_id])
        comments = article.comments
        render json: comments
    end
    def create
        user_signed_in?
        article = Article.find(params[:article_id])
        @comment = article.comments.build(comment_params)
        @comment.save!
        render json: @comment
    end
    def destroy
        
    end
    private
    def comment_params
        params.require(:comment).permit(:content).merge(user_id: current_user.id, account_name: current_user.account_name)
    end
end