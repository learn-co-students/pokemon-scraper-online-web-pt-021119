class Pokemon
    attr_accessor :id, :name, :type, :db#, :hp

    def initialize(id:, name:, type:, db:)#, hp:)
        @id = id
        @name = name
        @type = type
        @db = db
        #@hp = hp
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        pm_data = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
        Pokemon.new(id:pm_data[0], name:pm_data[1], type:pm_data[2], db:pm_data[3])
    end

    def alter_hp(alter_hp, id)
        db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", alter_hp, self.id)
    end
end
