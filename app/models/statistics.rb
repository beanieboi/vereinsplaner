class Statistics
  def member_distribution_for_lsb
    entries = member_birthdate_distribution.map do |year, members|
      LsbEntry.new(year, members)
    end

    entries.sort_by { |e| e.year }
  end

  private

  def members_with_birthdate
    @members_with_birthdate ||= Member.all.select { |m| m.date_of_birth.present? }
  end

  def member_birthdate_distribution
    members_with_birthdate.inject({}) do |memo, m|
      if memo.has_key?(m.date_of_birth.year)
        memo[m.date_of_birth.year] << m
      else
        memo[m.date_of_birth.year] = [ m ]
      end
      memo
    end
  end
end

class LsbEntry
  attr_reader :year

  def initialize(year, members)
    @year = year
    @members = members
  end

  def male_count
    @members.count { |m| m.male? }
  end

  def female_count
    @members.count { |m| m.female? }
  end

  def total
    male_count + female_count
  end
end
