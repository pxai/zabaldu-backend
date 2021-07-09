# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class ArticlesControllerTest < ActionDispatch::IntegrationTest
      test 'should return all articles' do
        get api_v1_articles_url
        assert_response :success

        data = JSON.parse(@response.body)
        assert_equal data['articles'].length, 2
      end

      test 'should return one article' do
        get api_v1_articles_url
        assert_response :success

        data = JSON.parse(@response.body)
        id = data['articles'][0]['id']


        get api_v1_article_url(id)
        assert_response :success
        single_data = JSON.parse(@response.body)
        assert_equal data['articles'][0], single_data['article']
      end
    end
  end
end
