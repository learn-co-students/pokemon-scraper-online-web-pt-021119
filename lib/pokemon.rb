class Pokemon

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def id
  end

  def name
  end

  def type
  end

  def db
  end

  def self.save(name, type, db)
    db.execute( "INSERT INTO pokemon ( Name, Type ) VALUES (?, ? )", [name, type])
    #self.type = "electric",
    #self.db = @db
  end
end
