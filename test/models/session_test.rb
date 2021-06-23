# frozen_string_literal: true

require 'test_helper'

class SessionTest < ActiveSupport::TestCase
  test 'token is created' do
    user = User.find_by(email: 'email1')
    session = Session.create(user: user)

    assert_not_nil session.token
  end

  test 'get user from token' do
    user = User.find_by(email: 'email1')
    session = Session.create(user: user)

    assert_equal Session.find_user(session.token), user
  end
end
