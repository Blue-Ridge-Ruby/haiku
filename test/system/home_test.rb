require "application_system_test_case"

class HomeTest < ApplicationSystemTestCase
  test "home page displays" do
    visit root_url

    assert_text "Blue Ridge Ruby Haiku Giveaway"
    assert_text "Submit Your Haiku"
    assert_text "0 haikus submitted"
  end
end
