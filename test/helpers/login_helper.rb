# frozen_string_literal: true

module LoginHelper
  def login_as_admin
    post(
      '/sessions',
      params: {
        user: {
          email: 'ich@abwesend.com',
          password: 'vereinsplaner'
        }
      }
    )
    assert_response :redirect
    follow_redirect!
  end

  def login_as_nobody
    post(
      '/sessions',
      params: {
        user: {
          email: 'ich@nobody.com',
          password: 'vereinsplanernobody'
        }
      }
    )
    assert_response :redirect
    follow_redirect!
  end
end
