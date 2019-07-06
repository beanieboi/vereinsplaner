class ApplicationController < ActionController::Base
  include AuthenticatedSystem

  before_action :login_required

  before_action :set_locale

  def set_locale
    I18n.locale = :de
  end
end
