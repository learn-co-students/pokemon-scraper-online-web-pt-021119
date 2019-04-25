class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    search = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    pokemon_array = search[0]
    test = Pokemon.new(id: pokemon_array[0], name: pokemon_array[1], type: pokemon_array[2], db: db, hp: 60)
  end


end
