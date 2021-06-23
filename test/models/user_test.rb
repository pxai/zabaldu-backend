# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user exists' do
    user = User.new(email: 'email1')
    assert user.exists?
  end

  test 'user does not exist' do
    user = User.new(email: 'nope')
    assert_not user.exists?
  end
end
