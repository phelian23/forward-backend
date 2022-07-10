class Api::V1::ViewsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @article.view_counter += 1
    @article.save
    render json: { success: true, data: @article, message: "Article viewed successfully." }
  end
end