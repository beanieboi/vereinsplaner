# frozen_string_literal: true

module AuthenticatedSystem
  # Inclusion hook to make #current_user and #logged_in?
  # available as ActionView helper methods.
  def self.included(base)
    base.send :helper_method, :current_user, :logged_in?
  end

  protected

  def login_required
    authorized? || access_denied
  end

  # Returns true if the user is logged in, false otherwise
  # Preloads @current_user with the user model if they're logged in.
  def logged_in?
    current_user.present?
  end

  def access_denied
    redirect_to new_session_path, alert: 'Please sign in to proceed'
  end

  # Accesses the current user from the session.
  def current_user
    @current_user ||= login_from_session
  end

  # Sign in the user
  #
  # updates the session and sets the current_user
  def sign_in(new_user)
    session['current_user_id'] = new_user.id
    @current_user = nil
    current_user
  end

  # Logout for the user
  #
  # kill session and remember me cookie
  def sign_out
    reset_session
    @current_user = nil
  end

  def authorized?
    logged_in?
  end

  def login_from_session
    current_user_id = session['current_user_id']
    User.find_by(id: current_user_id) if current_user_id.present?
  end

  def update_login_stats(remote_ip)
    update_login_sign_in_at
    update_login_sign_in_ip(remote_ip)

    current_user.sign_in_count ||= 0
    current_user.sign_in_count += 1
    current_user.save
  end

  def update_login_sign_in_at
    old_current = current_user.current_sign_in_at
    new_current = Time.now.utc
    current_user.last_sign_in_at = old_current || new_current
    current_user.current_sign_in_at = new_current
  end

  def update_login_sign_in_ip(remote_ip)
    old_current = current_user.current_sign_in_ip
    new_current = remote_ip
    current_user.last_sign_in_ip = old_current || new_current
    current_user.current_sign_in_ip = new_current
  end
end
