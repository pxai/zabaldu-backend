# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApplicationController
      def index
        categories = Category.all()

        render json: { categories: categories }
      end

      def show
        category = Category.find(params[:id])

        render json: { category: category }
      end

      private

      def category_params
        params.require(:category).permit(:name, :description)
      end
    end
  end
end
