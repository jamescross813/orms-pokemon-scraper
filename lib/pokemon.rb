class Pokemon
attr_accessor :id, :name, :type, :db


    def initialize(id:, name:, type:, db:)
        @name = name
        @type = type
        @id = id
        @db = db        
    end

    def self.save(name, type, db)
      sql = <<-SQL
        INSERT INTO pokemon (name, type) 
        VALUES (?, ?)
      SQL
        db.execute(sql, [name, type])
        
    end

    def self.find(id, db)
        sql = <<-SQL
        SELECT *
        FROM pokemon
        WHERE id = ?
        SQL
        result = db.execute(sql, [id]).flatten
       
        self.new(id:result[0], name:result[1], type:result[2], db:db)
        
    end
end
