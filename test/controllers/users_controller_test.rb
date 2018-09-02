require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
	test "Get new user form" do
		get new_user_registration_path
		assert_select ('div.field input'), 9
	end

	test "create new user" do
		user = FactoryBot.create(:user)
		post user_registration_path, params: {
						user: {
							email: user.email,
							first_name: user.first_name, last_name: user.last_name,
							birthday: user.birthday,
							quote: user.quote,
							password: user.password,
							password_confirmation: user.password_confirmation
						}
		}
		follow_redirect!
		#assert_redirected_to user_path(user)
		assert response.body.include?(users(:miguel).email)
	end

	test "will not save with missing info" do
		post user_registration_path, params: {
						user: {
							email: users(:julie).email, first_name: users(:julie).first_name
						}
		}
		assert_response :success
		assert_select "div#error_explanation", count: 1
	end

  test "should get show" do
  	user = FactoryBot.create(:user)
    get user_path(user)
    assert_response :success
    assert response.body.include?(user.email)
  end

  test "will update user" do
  	user = FactoryBot.create(:user)
  	sign_in user
  	patch user_registration_path, params: {
  						user:{
  							quote: "this is a test quote"
  						}
  	}
  	assert_response :success
  	assert_equal "this is a test quote", user.quote
  end
end
