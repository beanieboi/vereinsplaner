class MembershipType
  attr_reader :id, :name

  def initialize(id, name)
    @id = id
    @name = name
  end

  def self.all
    [
      full,
      discounted,
      passive,
      support,
      unknown
    ]
  end

  def self.full
    MembershipType.new("full", "Aktive Mitgliedschaft")
  end

  def self.discounted
    MembershipType.new("discounted", "ermäßigte Mitgliedschaft")
  end

  def self.passive
    MembershipType.new("passive", "Passive Mitgliedschaft")
  end

  def self.support
    MembershipType.new("support", "Fördermitgliedschaft")
  end

  def self.unknown
    MembershipType.new("unknown", "Unbekannt")
  end
end