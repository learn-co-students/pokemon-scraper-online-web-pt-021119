require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(id = nil, name = nil, type = nil, db)
    @id = id
    @db = db
    @name = name
    @type = type
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    insertion = db.prepare("INSERT INTO pokemon (name, type) VALUES (?, ?)")
    insertion.execute(name,type)
  end

  def self.find(id, db)
    query = db.execute("SELECT * FROM pokemon WHERE id = #{id};")
    query = query.flatten
    pokemon = self.new(query[0],query[1],query[2],db)
    # binding.pry
  end

end
