# frozen_string_literal: true

module Admin
  class DashboardController < BaseController
    def index
      authorize User
      @users = User.all
    end
  end
end
