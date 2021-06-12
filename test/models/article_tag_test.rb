require "test_helper"

class ArticleTagTest < ActiveSupport::TestCase
  test "can create tag for article" do
    tag = Tag.new(tag: 'euskara')
    tag.save
    assert_equal articles(:one).tags.length, 1

    articles(:one).tags.push(tag)
    articles(:one).save

    assert_equal articles(:one).tags.length, 2
    assert_equal articles(:one).tags.second, tag
  end

  test "can get article through tag" do
    assert_equal tags(:one).articles.length, 1
  end
end
