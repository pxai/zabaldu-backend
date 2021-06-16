require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "can create category" do
    category = Category.new(name: 'aaa', description: 'bbb')
    category.save
    
    assert_not_nil category
  end
end
