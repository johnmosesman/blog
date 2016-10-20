require 'pry'

class Test
  def self.some_method
    puts "Start"

    binding.pry

    puts "End"
  end
end

