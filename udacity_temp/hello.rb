class Customer


  @@id = 1
  @@customers = []

  def initialize
    @id = @@id
    @@id += 1
    @@customers << self
  end
  
  def self.customers
    @@customers
  end
end