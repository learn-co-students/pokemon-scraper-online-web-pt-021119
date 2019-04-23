class Pokemon
    attr_accessor :id,:name,:type, :db

    @@all=[]
    
    def initialize(id)
        @id=id
        @name=name
        @type=type
        @db=db
        @@all<<self
    end

    def self.save (name, type,db)
        db.execute ("INSERT INTO pokemon (name,type) VALUES (?, ?)", name, type)
    end

    

end
