require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index as root" do
    get root_path
    assert_response :success
    assert_select ('div#exCollapsingNavbar'), 1
  end

  test "should get contact page" do
    get contact_path
    assert_response :success
  end

  test "should get about" do
    get about_path
    assert_response :success
  end

end
