class Api::V1::ArticlesController < ApplicationController
  def index
    @all_articles = Article.search(params[:query])
    @query_articles = @all_articles.limit(limit).offset(params[:offset])
    @articles = @query_articles.map do |article|
      {
        id: article.id,
        title: article.title,
        content: article.content,
        category: article.category,
        author: article.user.name,
        image: article.image.attached? ? url_for(article.image) : nil,
        view_counter: article.view_counter,
        created_at: article.created_at,
        updated_at: article.updated_at
      }
    end
    render json: { success: true, data: @articles, message: "Articles fetched successfully." }
  end

  def most_viewed
    @all_articles = Article.all.order(view_counter: :desc).limit(limit).offset(params[:offset])
    @articles = @all_articles.map do |article|
      {
        id: article.id,
        title: article.title,
        content: article.content,
        category: article.category,
        author: article.user.name,
        image: article.image.attached? ? url_for(article.image) : nil,
        view_counter: article.view_counter,
        created_at: article.created_at,
        updated_at: article.updated_at
      }
    end
    render json: { success: true, data: @articles, message: "Articles fetched successfully." }
  end

  def most_recent
    @all_articles = Article.all.order(created_at: :desc).limit(limit).offset(params[:offset])
    @articles = @all_articles.map do |article|
      {
        id: article.id,
        title: article.title,
        content: article.content,
        category: article.category,
        author: article.user.name,
        image: article.image.attached? ? url_for(article.image) : nil,
        view_counter: article.view_counter,
        created_at: article.created_at,
        updated_at: article.updated_at
      }
    end
    render json: { success: true, data: @articles, message: "Articles fetched successfully." }
  end

  private

  def limit
    [params.fetch(:limit, 10).to_i, 10].min
  end
end
