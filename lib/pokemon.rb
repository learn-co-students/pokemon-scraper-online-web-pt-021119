class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def alter_hp(59, @db)

  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end

  def self.find(id, db)
    poke = db.execute("SELECT id, name, type FROM pokemon WHERE id = ?", id).flatten
    self.new(id: poke[0], name: poke[1], type: poke[2], db: db)
  end
end
