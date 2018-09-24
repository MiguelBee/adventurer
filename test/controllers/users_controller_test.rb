require 'test_helper'
require 'date'

class UsersControllerTest < ActionDispatch::IntegrationTest

	test "Get new user form" do
		get new_user_registration_path
		assert_select ('div.field input'), 10
	end

	test "create new user" do
		post user_registration_path, params: {
				user: {
							username: "phatkid",
							about: "this is about",
							email: "fake@email.com",
							first_name: "miguel",
							last_name: "bustamante",
							birthday: Date.today - 36,
							adventurer_type: "Moto Trekker",
							quote: "I die a little every dat",
							password: "bustas",
							password_confirmation: "bustas"
					}
		}
		user = User.last
		assert_redirected_to user_path(user)
		assert response.body.include?(user.first_name)
	end

	test "will not save with missing info" do
		user = FactoryBot.create(:user)
		post user_registration_path, params: {
						user: {
							email: user.email, first_name: user.first_name
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
    assert response.body.include?(user.full_name)
  end

  test "will update user" do
  	user = FactoryBot.create(:user)
  	patch user_registration_path, params: {
  					user: {
  							quote: "this is a test quote",
  							current_password: user.password
	  				}
  	}
  	assert_equal "this is a test quote", user.quote
  end
end
