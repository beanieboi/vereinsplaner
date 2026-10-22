# frozen_string_literal: true

module Admin
  class BaseController < ApplicationController
    # Every admin action must call authorize; otherwise Pundit raises.
    after_action :verify_authorized
  end
end
