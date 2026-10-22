# frozen_string_literal: true

require "test_helper"

module Admin
  class UsersControllerTest < ActionDispatch::IntegrationTest
    test "admin can create a user" do
      login_as_admin

      assert_difference("User.count") do
        post admin_users_url, params: {
          user: {
            nickname: "neu",
            email: "neu@example.com",
            password: "geheim123",
            password_confirmation: "geheim123"
          }
        }
      end

      assert_redirected_to admin_dashboard_index_path
    end

    test "admin can grant admin to another user" do
      login_as_admin
      nobody = users(:nobody)

      patch admin_user_url(nobody), params: { user: { admin: true } }

      assert_redirected_to admin_dashboard_index_path
      assert nobody.reload.admin?
    end

    test "admin can revoke admin from another user" do
      login_as_admin
      nobody = users(:nobody)
      nobody.update!(admin: true)

      patch admin_user_url(nobody), params: { user: { admin: false } }

      assert_redirected_to admin_dashboard_index_path
      assert_not nobody.reload.admin?
    end

    test "admin update without admin key keeps the flag" do
      login_as_admin
      nobody = users(:nobody)
      nobody.update!(admin: true)

      patch admin_user_url(nobody), params: { user: { nickname: "renamed" } }

      assert_redirected_to admin_dashboard_index_path
      assert nobody.reload.admin?
      assert_equal "renamed", nobody.nickname
    end

    test "admin cannot demote themselves" do
      login_as_admin
      ben = users(:ben)

      patch admin_user_url(ben), params: { user: { admin: false, nickname: "still-admin" } }

      assert_redirected_to admin_dashboard_index_path
      assert ben.reload.admin?
      assert_equal "still-admin", ben.nickname
    end

    test "admin cannot delete themselves" do
      login_as_admin

      assert_no_difference("User.count") do
        delete admin_user_url(users(:ben))
      end

      assert_redirected_to root_path
    end

    test "admin can delete another user" do
      login_as_admin

      assert_difference("User.count", -1) do
        delete admin_user_url(users(:nobody))
      end

      assert_redirected_to admin_dashboard_index_path
    end

    test "invalid update re-renders the edit form" do
      login_as_admin

      patch admin_user_url(users(:nobody)), params: { user: { email: "" } }

      assert_response :unprocessable_content
      assert_select "form[action=?]", admin_user_path(users(:nobody))
    end

    test "non-admin cannot delete users" do
      login_as_nobody

      assert_no_difference("User.count") do
        delete admin_user_url(users(:ben))
      end

      assert_redirected_to root_path
    end

    test "non-admin cannot grant themselves admin" do
      login_as_nobody
      nobody = users(:nobody)

      patch admin_user_url(nobody), params: { user: { admin: true } }

      assert_redirected_to root_path
      assert_not nobody.reload.admin?
    end

    test "non-admin cannot create users" do
      login_as_nobody

      assert_no_difference("User.count") do
        post admin_users_url, params: {
          user: {
            nickname: "evil",
            email: "evil@example.com",
            admin: true,
            password: "geheim123",
            password_confirmation: "geheim123"
          }
        }
      end

      assert_redirected_to root_path
    end

    test "non-admin cannot open user forms" do
      login_as_nobody

      get new_admin_user_url
      assert_redirected_to root_path

      get edit_admin_user_url(users(:ben))
      assert_redirected_to root_path
    end

    test "non-admin cannot open the admin dashboard" do
      login_as_nobody

      get admin_dashboard_index_url

      assert_redirected_to root_path
    end
  end
end
