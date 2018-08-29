require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
	test "Get new user form" do
		get new_user_registration_path
		assert_select ('div.field input'), 9
	end

	test "create new user" do
		post user_registration_path, params: {
						user: {
							email: users(:miguel).email,
							first_name: users(:miguel).first_name, last_name: users(:miguel).last_name,
							birthday: users(:miguel).birthday,
							password: users(:miguel).encrypted_password,
							password_confirmation: users(:miguel).encrypted_password
						}
		}
		 assert_response :success
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
  	sign_in user
    get user_path(user)
    assert_response :success
    assert response.body.include?(user.email)
  end

  test "will not get show without login" do
  	get user_path(users(:miguel))
  	assert_redirected_to new_user_session_path
  end

end
