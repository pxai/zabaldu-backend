# frozen_string_literal: true

module Api
  module V1
    class CommentVotesController < ApplicationController
      include CheckToken
      prepend_before_action :check_token, only: [:vote, :destroy]
      before_action :has_permission, only: [:destroy]

      def vote
        check_if_destroy
        @comment_vote = CommentVote.new(comment_vote_params)

        if @comment_vote.save
          render json: @comment_vote
        else
          render json: { error: true, msg: "Error creating Comment vote: #{@comment_vote.errors.full_messages}" }.to_json
        end
      end

      def destroy
        if @comment_vote.destroy
          render json: @comment_vote
        else
          render json: { error: true, msg: "Error destroying Comment vote: #{@comment_vote.errors.full_messages}" }.to_json
        end
      end

      private

      def check_if_destroy
        @comment_vote = CommentVote.where(comment_vote_params).first

        if @comment_vote && @comment_vote.user_id == @user.id
          destroy
        end
      end

      def has_permission
        @comment_vote = Comment.find(params[:id])
        @comment_vote.user_id == @user.id
      end

      def comment_vote_params
        params.require(:comment_vote).permit(:comment_id, :user_id)
      end
    end
  end
end
