require "test_helper"

class StatusTest < ActiveSupport::TestCase
  test "can create a status" do
    status = Status.new(code: "published")

    assert_not_nil status
  end
end
