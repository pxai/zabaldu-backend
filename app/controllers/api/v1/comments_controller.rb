# frozen_string_literal: true

module Api
  module V1
    class CommentsController < ApplicationController
      include CheckToken
      include Pagination
      prepend_before_action :check_token, only: [:create, :update, :destroy]
      before_action :has_permission, only: [:update, :destroy]

      def index
        comments = Comment.limit(page_size).offset(set_offset * page_size)

        render json: { comments: comments }
      end

      def show
        comment = Comment.find(params[:id])

        render json: { comment: comment }
      end

      def create
        @comment = Comment.new(comment_params)

        if @comment.save
          render json: @comment
        else
          render json: { error: true, msg: "Error creating Comment: #{@comment.errors.full_messages}" }.to_json
        end
      end

      def update
        if @comment.update(comment_params)
          render json: @comment
        else
          render json: { error: true, msg: "Error updating Comment: #{@comment.errors.full_messages}" }.to_json
        end
      end

      def destroy
        @comment.status_id = 2
        if @comment.save
          render json: @comment
        else
          render json: { error: true, msg: "Error destroying Comment: #{@comment.errors.full_messages}" }.to_json
        end
      end

      private

      def has_permission
        @comment = Comment.find(params[:id])
        @comment.user_id == @user.id
      end

      def comment_params
        params.require(:comment).permit(:body, :article_id, :user_id)
      end
    end
  end
end
