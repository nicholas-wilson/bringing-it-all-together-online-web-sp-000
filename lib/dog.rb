class Dog
  attr_accessor :name, :breed
  attr_reader :id

  def initialize(attributes)
    @name = attributes[:name]
    @breed = attributes[:breed]
    @id = attributes[:id]
  end

  def save
    sql = <<-SQL
      INSERT INTO dogs (name, breed)
      VALUES (?, ?)
    SQL
    DB[:conn].execute(sql, self.name, self.breed)
    @id = DB[:conn].execute("SELECT last_insert_rowid()")[0][0]
    self
  end

  def update

  end

  def self.create(attributes)
    dog = self.new(attributes)
    dog.save
  end

  def self.new_from_db(row)
    attributes = {id: row[0][0], name: row[0][1], breed: row[0][2]}
    self.create(attributes)
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS dogs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        breed TEXT
      )
    SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = <<-SQL
      DROP TABLE IF EXISTS dogs
    SQL
    DB[:conn].execute(sql)
  end
end
