require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  test 'Article exists' do
    article = Article.new(body: 'blah')
    assert_not_nil article
  end
end
