class Dog
  attr_accessor :name, :breed
  attr_reader :id

  def initialize(attributes)
    @name = attributes[:name]
    @breed = attributes[:breed]
    @id = attributes[:id]
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
      DROP TABLE IF NOT EXISTS dogs
    SQL
    DB[:conn].execute(sql)
  end
end
