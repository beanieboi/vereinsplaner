# frozen_string_literal: true

module Admin
  class DashboardController < ApplicationController
    def index
      @users = User.all
    end
  end
end
