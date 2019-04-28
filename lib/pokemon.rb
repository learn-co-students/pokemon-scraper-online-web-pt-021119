class Pokemon
  
  attr_accessor :id, :name, :type, :db
  
  @@all = []
  
  def initialize(id:, name:, type:, db:)
    @id = id 
    @name = name 
    @type = type
    @db = db
    @@all << self
  end
  
  def self.all 
    @@all 
  end
  
  def self.save(name,type,db)
    db.execute("INSERT into pokemon (name, type) VALUES (?,?)",name,type)
  end
  
  def self.find(id,db)
   id, name, type = db.execute("SELECT * FROM pokemon WHERE id = ?" , id).flatten
   return self.new(id: id, name: name, type: type, db: db)
  end
  
end
