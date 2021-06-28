# frozen_string_literal: true

module Api
  module V1
    class ArticleVotesController < ApplicationController
      include CheckToken
      prepend_before_action :check_token, only: [:vote, :destroy]
      before_action :has_permission, only: [:destroy]

      def vote
        check_if_destroy
        @article_vote = ArticleVote.new(article_vote_params)

        if @article_vote.save
          render json: @article_vote
        else
          render json: { error: true, msg: "Error creating vote: #{@article_vote.errors.full_messages}" }.to_json
        end
      end

      def destroy
        if @article_vote.destroy
          render json: @article_vote
        else
          render json: { error: true, msg: "Error destroying Article vote: #{@article_vote.errors.full_messages}" }.to_json
        end
      end

      private

      def check_if_destroy
        @article_vote = ArticleVote.where(article_vote_params).first

        if @article_vote && @article_vote.user_id == @user.id
          destroy
        end
      end

      def has_permission
        @article_vote = Article.find(params[:id])
        @article_vote.user_id == @user.id
      end

      def article_vote_params
        params.require(:article_vote).permit(:article_id, :user_id)
      end
    end
  end
end
