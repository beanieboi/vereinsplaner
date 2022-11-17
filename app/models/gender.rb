class Gender
  attr_reader :id, :name

  def initialize(id, name)
    @id = id
    @name = name
  end

  def self.all
    [
      self.new(:male, "männlich"),
      self.new(:female, "weiblich"),
      self.new(:undisclosed, "keine Angabe")
    ]
  end
end
