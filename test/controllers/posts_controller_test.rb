require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new for travel picture" do
    user = FactoryBot.create(:user)
    adventure = FactoryBot.create(:adventure, user)
  	assert_response :success
  #  sign_in user
  #  get adventure_travel_picture_path(adventure)
  #  assert_response :success
  #  assert_redirect_to adventure_path(adventure)
  end

end
