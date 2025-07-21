module TestSupport
  module WithClues
    #  Wrap any assertion with this method to get more
    # useful context and dianostics when a test is
    # unexpextedly failing.
    def with_clues(&block)
      block.()
    rescue Exception => ex
      puts "[ with_clues ] Test failed: #{ex.message}"
      puts "[ with_clues ] HTML {"
      puts
      puts page.html
      puts
      puts "[ with_clues ] } END HTML"
      raise ex
    end
  end
end
