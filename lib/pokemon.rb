class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        pm_data = db.execute("SELECT name FROM pokemon WHERE id = ?", id).flatten
        Pokemon.new(id:pm_data[0], name:pm_data[1], type:pm_data[2], db:pm_data[3])
    end
end
