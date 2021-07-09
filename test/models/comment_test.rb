require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test 'Comment exists' do
    comment = Comment.new(body: 'blah')
    assert_not_nil comment
  end

  test 'Comment belongs to user' do
    comment = Comment.find_by(body: 'MyText1')
    assert_not_nil comment.user
  end

  test 'Comment belongs to article' do
    comment = Comment.find_by(body: 'MyText1')
    assert_not_nil comment.article
  end
end
