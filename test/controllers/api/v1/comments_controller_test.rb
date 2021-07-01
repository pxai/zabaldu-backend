# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class CommentsControllerTest < ActionDispatch::IntegrationTest
      test 'should return all comments' do
        get api_v1_comments_url
        assert_response :success

        data = JSON.parse(@response.body)
        assert_equal data['comments'].length, 2
      end

      test 'should return all comments paginated' do
        get api_v1_comments_url({page: 0})
        assert_response :success

        data = JSON.parse(@response.body)
        assert_equal data['comments'].length, 2

        get api_v1_comments_url({page: 10})
        assert_response :success

        data = JSON.parse(@response.body)
        assert_equal data['comments'].length, 0
      end

      test 'should return one comment' do
        get api_v1_comments_url
        assert_response :success

        data = JSON.parse(@response.body)
        id = data['comments'][0]['id']


        get api_v1_comment_url(id)
        assert_response :success
        single_data = JSON.parse(@response.body)
        assert_equal data['comments'][0], single_data['comment']
      end

      test 'should create comment' do
        default_comment = {comment: { body: 'bbb', article_id: articles(:one), user_id: users(:one).id } }
        post api_v1_comments_url(default_comment),
             headers: { 'x-zabaldu-token' => 'MyString1' }
        assert_response :success

        comment = JSON.parse(@response.body)

        get api_v1_comment_url(comment['id'])
        generated = JSON.parse(@response.body)

        assert_equal generated['comment'], comment
      end

      test 'should create comment with default status to 3' do
        default_comment = {comment: { body: 'bbb', article_id: articles(:one), user_id: users(:one).id } }
        post api_v1_comments_url(default_comment),
             headers: { 'x-zabaldu-token' => 'MyString1' }
        assert_response :success

        comment = JSON.parse(@response.body)

        assert_equal comment['status_id'], 3
      end

      test 'should update comment' do
        get api_v1_comment_url(comments(:one).id)
        comment = JSON.parse(@response.body)

        comment['comment']['body'] = 'Body changed'

        put api_v1_comment_url(comments(:one).id, comment), headers: { 'x-zabaldu-token' => 'MyString1' }

        get api_v1_comment_url(comment['comment']['id'])
        generated = JSON.parse(@response.body)

        assert_equal generated['comment']['body'], 'Body changed'
      end

      test 'should delete comment' do
        get api_v1_comment_url(comments(:one).id)
        comment = JSON.parse(@response.body)
        assert_not_nil comment['comment']

        delete api_v1_comment_url(comments(:one).id), headers: { 'x-zabaldu-token' => 'MyString1' }

        get api_v1_comment_url(comment['comment']['id'])
        generated = JSON.parse(@response.body)

        assert_equal generated['comment']['status_id'], 2
      end
    end
  end
end
