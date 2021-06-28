# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class ArticleVotesControllerTest < ActionDispatch::IntegrationTest
      test 'should vote article' do
        article_vote = {article_vote: { article_id: articles(:one).id, user_id: users(:two).id } }
        post api_v1_articles_vote_url(article_vote),
             headers: { 'x-zabaldu-token' => 'MyString1' }
        assert_response :success

        vote = JSON.parse(@response.body)

        assert_equal vote['article_id'], articles(:one).id
      end

      test 'should destroy vote for article' do
        article_vote = {article_vote: { article_id: articles(:one).id, user_id: users(:two).id } }
        post api_v1_articles_vote_url(article_vote),
             headers: { 'x-zabaldu-token' => 'MyString1' }
        assert_response :success

        vote = JSON.parse(@response.body)

        assert_equal vote['article_id'], articles(:one).id

        post api_v1_articles_vote_url(article_vote),
            headers: { 'x-zabaldu-token' => 'MyString1' }
      end
    end
  end
end
