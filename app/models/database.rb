
class Database
  attr_reader :data

  def self.create
    @current_database = self.new
  end

  def self.instance
    @current_database
  end

  def initialize
    @data = {}
  end

  def add_pair(key, value)
    @data[key.to_sym] = value
  end
end
