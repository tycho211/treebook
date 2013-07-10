require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:friend)

  test "that creating a friendship works without raising an exception" do
    assert_nothing_raised do
      UserFriendship.create user: users(:cyprian), friend: users(:blaize)
    end
  end

  test "that creating a friendship based on a user id and a friend id works" do
    UserFriendship.create user_id: users(:cyprian).id, friend_id: users(:blaize).id
    assert users(:cyprian).friends.include?(users(:blaize))
  end
end