require "application_system_test_case"

class HomeTest < ApplicationSystemTestCase
  test "home page displays" do
    visit root_url

    assert_text "Haiku Ticket Giveaway"
    assert_text "Submit Your Haiku"
    assert_text "0 haikus submitted"
  end
end
