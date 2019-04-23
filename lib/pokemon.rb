class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, hp: 60, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;",hp, @id)
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end

  def self.find(id, db)
    poke = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    if poke[3].nil?
      self.new(id: poke[0], name: poke[1], type: poke[2], db: db)
    elsif poke[3] != nil
      self.new(id: poke[0], name: poke[1], type: poke[2], hp: poke[3], db: db)
    end
  end
end
