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

      test 'should return all articles paginated' do
        get api_v1_articles_url({page: 0})
        assert_response :success

        data = JSON.parse(@response.body)
        assert_equal data['articles'].length, 2

        get api_v1_articles_url({page: 10})
        assert_response :success

        data = JSON.parse(@response.body)
        assert_equal data['articles'].length, 0
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

      test 'should create article' do
        default_article = {article: { title: 'aaa', body: 'bbb', user_id: users(:one).id } }
        post api_v1_articles_url(default_article),
             headers: { 'x-zabaldu-token' => 'MyString1' }
        assert_response :success

        article = JSON.parse(@response.body)

        get api_v1_article_url(article['id'])
        generated = JSON.parse(@response.body)

        assert_equal generated['article'], article
      end

      test 'should create article with default status to 1' do
        default_article = {article: { title: 'aaa', body: 'bbb', user_id: users(:one).id } }
        post api_v1_articles_url(default_article),
             headers: { 'x-zabaldu-token' => 'MyString1' }
        assert_response :success

        article = JSON.parse(@response.body)

        assert_equal article['status_id'], 1
      end

      test 'should create article with default category to 1' do
        default_article = {article: { title: 'aaa', body: 'bbb', user_id: users(:one).id } }
        post api_v1_articles_url(default_article),
             headers: { 'x-zabaldu-token' => 'MyString1' }
        assert_response :success

        article = JSON.parse(@response.body)

        assert_equal article['category_id'], 1
      end

      test 'should update article' do
        get api_v1_article_url(articles(:one).id)
        article = JSON.parse(@response.body)
        article['article']['title'] = 'Changes'
        article['article']['body'] = 'Body changed'

        put api_v1_article_url(articles(:one).id, article), headers: { 'x-zabaldu-token' => 'MyString1' }

        get api_v1_article_url(article['article']['id'])
        generated = JSON.parse(@response.body)

        assert_equal generated['article']['title'], 'Changes'
        assert_equal generated['article']['body'], 'Body changed'
      end

      test 'should delete article' do
        get api_v1_article_url(articles(:one).id)
        article = JSON.parse(@response.body)
        assert_not_nil article['article']

        delete api_v1_article_url(articles(:one).id), headers: { 'x-zabaldu-token' => 'MyString1' }

        get api_v1_article_url(article['article']['id'])
        generated = JSON.parse(@response.body)

        assert_equal generated['article']['status_id'], 2
      end

      test 'should search for article' do
        post api_v1_articles_search_url({ term: "MyString" })
        articles = JSON.parse(@response.body)

        assert_equal articles['articles'].length, 2

        post api_v1_articles_search_url({ term: "xxx" })
        articles = JSON.parse(@response.body)

        assert_equal articles['articles'].length, 0
      end
    end
  end
end
