# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class CommentVotesControllerTest < ActionDispatch::IntegrationTest
      test 'should vote comment' do
        comment_vote = {comment_vote: { comment_id: comments(:one).id, user_id: users(:two).id } }
        post api_v1_comments_vote_url(comment_vote),
             headers: { 'x-zabaldu-token' => 'MyString1' }
        assert_response :success

        vote = JSON.parse(@response.body)

        assert_equal vote['comment_id'], comments(:one).id
      end

      test 'should destroy vote for comment' do
        comment_vote = {comment_vote: { comment_id: comments(:one).id, user_id: users(:two).id } }
        post api_v1_comments_vote_url(comment_vote),
             headers: { 'x-zabaldu-token' => 'MyString1' }
        assert_response :success

        vote = JSON.parse(@response.body)

        assert_equal vote['comment_id'], comments(:one).id

        post api_v1_comments_vote_url(comment_vote),
            headers: { 'x-zabaldu-token' => 'MyString1' }
      end
    end
  end
end
