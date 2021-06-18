require "test_helper"

class ArticleVoteTest < ActiveSupport::TestCase
  test "article can have votes" do
    articleVote = ArticleVote.create(user: users(:one), article: articles(:one))
  end

  test "article can have just one vote from user" do
    articleVote1 = ArticleVote.create(user: users(:one), article: articles(:one))
    articleVote2 = ArticleVote.create(user: users(:one), article: articles(:one))
  end
end
