# frozen_string_literal: true

require "test_helper"

class MemberTest < ActiveSupport::TestCase
  test "next_member_id starts at one when there are no members" do
    Member.delete_all

    assert_equal 1, Member.next_member_id
  end

  test "next_member_id increments the current maximum member id" do
    assert_equal members(:old).member_id + 1, Member.next_member_id
  end
end
