class ApplicationController < ActionController::Base
  include AuthenticatedSystem

  before_action :login_required
end
