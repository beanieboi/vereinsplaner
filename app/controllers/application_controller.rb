# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  include Pundit::Authorization

  before_action :login_required, :set_locale, :set_paper_trail_whodunnit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def set_locale
    I18n.locale = :de
  end

  private

  def user_not_authorized
    redirect_to root_path, alert: "Keine Berechtigung.", status: :see_other
  end
end
