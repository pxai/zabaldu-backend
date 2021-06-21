# frozen_string_literal: true

module Api
  module V1
    class ArticlesController < ApplicationController
      include CheckToken
      prepend_before_action :check_token, only: [:create, :update, :delete]
      before_action :has_permission, only: [:update, :delete]

      def index
        articles = Article.all()

        render json: { articles: articles }
      end

      def show
        article = Article.find(params[:id])

        render json: { article: article }
      end

      def create
        @article = Article.new(article_params)

        if @article.save
          render json: @article
        else
          render json: { error: true, msg: "Error creating Article: #{@article.errors.full_messages}" }.to_json
        end
      end

      def update
        if @article.update(article_params)
          render json: @article
        else
          render json: { error: true, msg: "Error creating Article: #{@article.errors.full_messages}" }.to_json
        end
      end

      private

      def has_permission
        @article = Article.find(params[:id])
        @article.user_id == article_params[:user_id]
      end

      def article_params
        params.require(:article).permit(:title, :body, :tags, :user_id, :status_id)
      end
    end
  end
end
