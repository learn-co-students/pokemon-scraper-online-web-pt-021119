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
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end

  def self.find(id, db)
    #binding.pry
    row = db.execute('select * from pokemon where id = ?;', id).flatten
    Pokemon.new(id: row[0], name: row[1], type: row[2], db: db, hp: row[3])
  end

  def alter_hp(hp, db)
    db.execute('update pokemon set hp = ? where id = ?;', hp, self.id)
  end

end
