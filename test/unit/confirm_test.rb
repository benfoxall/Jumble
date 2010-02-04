require 'test_helper'

class ConfirmTest < ActionMailer::TestCase
  test "cause" do
    @expected.subject = 'Confirm#cause'
    @expected.body    = read_fixture('cause')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Confirm.create_cause(@expected.date).encoded
  end

  test "item" do
    @expected.subject = 'Confirm#item'
    @expected.body    = read_fixture('item')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Confirm.create_item(@expected.date).encoded
  end

end
