# frozen_string_literal: true

class Gender
  attr_reader :id, :name

  def initialize(id, name)
    @id = id
    @name = name
  end

  def self.all
    [
      new(:male, "männlich"),
      new(:female, "weiblich"),
      new(:undisclosed, "keine Angabe")
    ]
  end
end
