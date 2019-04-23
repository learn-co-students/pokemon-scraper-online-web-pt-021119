require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :db, :hp, :pokemon

  def initialize (pokemon)
    @pokemon = pokemon
  end

  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find (id, db)
    pokemon = db.execute('SELECT * FROM pokemon WHERE id = ?', id).flatten
    new_pokemon = self.new(pokemon)
    new_pokemon.id = pokemon[0]
    new_pokemon.name = pokemon[1]
    new_pokemon.type = pokemon[2]
    new_pokemon.hp = pokemon[3]
    new_pokemon
  end

  def alter_hp(hp, db)
    db.execute('UPDATE pokemon SET hp = ?', hp)
  end

end
