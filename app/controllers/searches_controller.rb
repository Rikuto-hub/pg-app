class SearchesController < ApplicationController
  def index
    @articles = Article.search(params[:search])
  end
end