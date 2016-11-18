require_relative 'champion'

class Team
  attr_reader :roster, :name, :id
  @@count = 0
  def initialize(name)
    @roster = []
    @name = name
    @@count += 1
    @id = @@count
  end
  def add_by_name(name)
    raise ArgumentError unless name.is_a?(String)
    champ = Champion.by_name(name)
    @roster << champ unless champ.nil?
  end
  def strengths
    hash = Hash.new(0)
    @roster.each do |teammate|
      teammate.strengths.each do |strength|
        hash[strength] += 1
      end
    end
    hash
  end
end
