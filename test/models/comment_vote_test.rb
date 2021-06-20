require "test_helper"

class CommentVoteTest < ActiveSupport::TestCase
  test "comment can have votes" do
    commentVote = CommentVote.create(user: users(:one), comment: comments(:one))
  end

  test "comment cant have just one vote from user" do
    commentVote1 = CommentVote.create(user: users(:one), comment: comments(:one))
    commentVote2 = CommentVote.create(user: users(:one), comment: comments(:one))
  end
end
