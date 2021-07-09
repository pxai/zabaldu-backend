# frozen_string_literal: true

module Api
  module V1
    class ArticlesController < ApplicationController
      def index
        articles = Article.all()

        render json: { articles: articles }
      end

      def show
        article = Article.find(params[:id])

        render json: { article: article }
      end

      private

      def article_params
        params.require(:article).permit(:title, :body)
      end
    end
  end
end
