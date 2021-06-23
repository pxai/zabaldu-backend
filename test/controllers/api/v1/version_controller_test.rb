# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class VersionControllerTest < ActionDispatch::IntegrationTest
      test 'default / should return version' do
        get '/'
        assert_response :success

        assert_version_data JSON.parse(@response.body)
      end

      test 'should return version' do
        get api_v1_version_url
        assert_response :success

        assert_version_data JSON.parse(@response.body)
      end

      def assert_version_data(data)
        assert_equal data['name'], 'zabaldu'
        assert_equal data['env'], 'test'
        assert_equal data['build'].length, 40
      end
    end
  end
end
