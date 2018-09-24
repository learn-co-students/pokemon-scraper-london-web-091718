require 'pry'
class Pokemon
  attr_accessor :hp
  attr_reader :id, :name, :type, :db
  @@all = []

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    poke = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id:poke[0], name:poke[1], type:poke[2], hp:poke[3], db:@db)
  end

  def alter_hp(health, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", health, self.id)
  end
end

# binding.pry
# p 'eof'
