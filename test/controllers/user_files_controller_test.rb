require 'test_helper'

class UserFilesControllerTest < ActionDispatch::IntegrationTest
  test "visit files without login" do
    get user_file_url ('photos')
    assert_equal 302, status
    assert_redirected_to new_user_session_url
  end
  test "visit user photo with login" do
    sign_in users(:one), 'secret'
    get user_file_url ('photos')
    assert_equal 200, status
  end
end
