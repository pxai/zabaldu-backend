require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  test 'Article exists' do
    article = Article.new(body: 'blah')
    assert_not_nil article
  end

  test 'Article has 1 as default status' do
    article = Article.create(title: 'aaa', body: 'bbb', user: users(:one))

    assert_equal article.status_id, 1
  end
end
