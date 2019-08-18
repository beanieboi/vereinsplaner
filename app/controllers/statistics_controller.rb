class StatisticsController < ApplicationController
  def index
    @members_without_birthdate = Member.all.select { |m| m.date_of_birth.nil? }
    @statistics = Statistics.new
  end
end
