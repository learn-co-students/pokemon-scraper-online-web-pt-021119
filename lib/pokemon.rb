require 'pry'


class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize (id:, name:, type:, hp: nil, db:)
    @name = name
    @type = type
    @id = id
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db) #finds a pokemon from the database by their id number and returns a new Pokemon object
    pokemon = db.execute("SELECT * FROM pokemon where ID=?", id).flatten
    Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], hp: pokemon[3], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE ID = ?", hp, self.id)
  end

end
