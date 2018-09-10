require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

	test "Get new user form" do
		get new_user_registration_path
		assert_select ('div.field input'), 10
	end

	test "create new user" do
		user = FactoryBot.create(:user)
		post user_registration_path, params: {
						user: {
							username: user.username,
							about: user.about,
							email: user.email,
							first_name: user.first_name, last_name: user.last_name,
							birthday: user.birthday,
							quote: user.quote,
							password: user.password,
							password_confirmation: user.password_confirmation
						}
		}
		assert_response :success
		assert response.body.include?(user.full_name)
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
    assert response.body.include?(user.first_name)
  end

  test "will update user" do
  	user = FactoryBot.create(:user)
  	sign_in user
  	patch user_registration_path, params: {
  						user:{
  							username: user.username,
  							first_name: user.first_name,
  							last_name: user.last_name,
  							birthday: user.birthday,
  							about: user.about,
  							quote: "this is a test quote",
  							current_password: user.password
  						}
  	}
  	assert_equal "this is a test quote", user.quote
  end
end
