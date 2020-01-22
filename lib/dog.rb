class Dog
  attr_accessor :name, :breed
  attr_reader :id

  def initialize(attributes)
    @name = attributes[:name]
    @breed = attributes[:breed]
    @id = attributes[:id]
  end
end
