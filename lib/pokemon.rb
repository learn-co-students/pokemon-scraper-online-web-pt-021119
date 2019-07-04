class Pokemon
  
  attr_accessor :name, :type, :db, :hp
  attr_reader :id
  
  def initialize(id:, name:, type:, db:, hp:nil)
    @id = id 
    @name = name 
    @type = type
    @db = db 
    @hp = hp
  end
  
  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, database_connection)
    pokemon = database_connection.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    name = pokemon[1]
    type = pokemon[2]
    hp = pokemon[3]
    
    pokemon_inst = Pokemon.new(id: id, name: name, type: type, hp: hp, db: database_connection)
  end
    
  def alter_hp(new_hp, database_connection)
    database_connection.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, @id)
  end
  
  
end
