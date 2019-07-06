class ApplicationController < ActionController::Base
  include AuthenticatedSystem

  before_action :login_required, :set_locale, :set_paper_trail_whodunnit

  def set_locale
    I18n.locale = :de
  end
end
