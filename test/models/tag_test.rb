require "test_helper"

class TagTest < ActiveSupport::TestCase
  test "can create tag" do
    tag = Tag.new(tag: 'euskara')
    assert_not_nil tag
  end

  test "can normalize tag" do
    tag = Tag.new(tag: 'Euskara')
    assert_equal tag.tag, 'Euskara'

    tag.save

    assert_equal tag.tag, 'euskara'
  end
end
