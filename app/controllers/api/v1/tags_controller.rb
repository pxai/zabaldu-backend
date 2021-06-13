# frozen_string_literal: true

module Api
  module V1
    class TagsController < ApplicationController
      def index
        tags = Tag.all()

        render json: { tags: tags }
      end

      def show
        tag = Tag.find(params[:id])

        render json: { tag: tag }
      end

      private

      def tag_params
        params.require(:tag).permit(:title, :body)
      end
    end
  end
end
