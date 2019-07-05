class Country
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.all
    [
      Country.new("Deutschland")
    ]
  end
end