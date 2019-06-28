# frozen_string_literal: true

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'redirects to dashboard if logged in' do
    login_as_admin

    get new_session_url

    assert_redirected_to controller: 'dashboards', action: 'show'
  end

  test 'login fails with invalid credentials' do
    post(
      '/sessions',
      params: {
        user: {
          email: 'ich@abwesend.com',
          password: 'wrongpassword'
        }
      }
    )
    assert_response :redirect
    assert_equal 'Invalid email or password.', flash[:alert]
  end
end
