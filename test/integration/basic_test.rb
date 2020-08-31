require 'test_helper'

class BasicTest < ActionDispatch::IntegrationTest
  test "visit home" do
    get "/"
    assert_equal 200, status
    assert_select 'h1', "Welcome to Ruby on rails + Vue.js app"
  end
end
