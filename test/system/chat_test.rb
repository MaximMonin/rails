require "application_system_test_case"

class ChatTest < ApplicationSystemTestCase
  test "chat basic test" do
    visit new_user_session_url
    fill_in "user_email", with: users(:one).email
    fill_in "user_password", with: 'secret'
    click_on "commit"
    click_on users(:one).username
    click_on "Chat Rooms"
    assert_text "Welcome to chat"
    click_on chats(:one).name
    page.has_content?('Enter message')

    take_screenshot
  end
end
