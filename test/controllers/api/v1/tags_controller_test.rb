# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class TagsControllerTest < ActionDispatch::IntegrationTest
      test 'should return all tags' do
        get api_v1_tags_url
        assert_response :success

        data = JSON.parse(@response.body)
        assert_equal data['tags'].length, 2
      end

      test 'should return one tag' do
        get api_v1_tags_url
        assert_response :success

        data = JSON.parse(@response.body)
        id = data['tags'][0]['id']


        get api_v1_tag_url(id)
        assert_response :success
        single_data = JSON.parse(@response.body)
        assert_equal data['tags'][0], single_data['tag']
      end
    end
  end
end
