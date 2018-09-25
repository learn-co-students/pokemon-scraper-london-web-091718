
require "pry"

class Pokemon


  @@all =[]

  attr_accessor :id, :name, :type, :db

  def initialize(id:id, name:name,type:type,db:db)
    @id=id
    @name=name
    @type=type
    @db=db
    #binding.pry
  end

def self.all
  @@all
end

def self.save(name,type,db)
db.execute("INSERT INTO pokemon (name,type) VALUES (?,?)",name,type)
#binding.pry
end

def self.find(id,db)
  sql = "SELECT * FROM pokemon WHERE id = ?"
  pokemon=db.execute(sql,id)[0]
  return Pokemon.new(id:pokemon[0],name:pokemon[1],type:pokemon[2],db:db)
#binding.pry
end


end
