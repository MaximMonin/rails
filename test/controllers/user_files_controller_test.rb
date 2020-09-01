require 'test_helper'

class UserFilesControllerTest < ActionDispatch::IntegrationTest
  test "visit files without login" do
    get user_file_url ('photos')
    assert_equal 401, status
  end
  test "visit user photo with login" do
    sign_in_as users(:one)
    get user_file_url ('photos')
    assert_equal 200, status
  end
end
