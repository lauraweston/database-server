
class Database
  attr_reader :data
  
  def initialize
    @data = {}
  end

  def add_pair(key, value)
    @data[key.to_sym] = value
  end
end
