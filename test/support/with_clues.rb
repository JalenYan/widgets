module TestSupport
  module WithClues
    #  Wrap any assertion with this method to get more
    # useful context and dianostics when a test is
    # unexpextedly failing.
    def with_clues(&block)
      block.()
    rescue Exception => ex
      puts "[ with_clues ] Test failed: #{ex.message}"
      if page.driver.respond_to?(:browser)
        if page.driver.browser.respond_to?(:logs)
          logs = page.driver.browser.logs
          browser_logs = logs.get(:browser)
          puts "[ with_clues ] Browser Logs:"
          browser_logs.each do |log|
            puts "  #{log.level.upcase}: #{log.message}"
          end
          puts "[ with_clues ] END Browser Logs"
        else
          puts "[ with_clues ] NO BROWSER LOGS: " +
          "page.driver.brower" +
          "#{page.driver.browser.class} " +
          "does not respond to #logs"
        end
      else
        puts "[ with_clues ] NO BROWSER LOGS: page.driver " +
        "#{page.driver.class} does not respond to #browser"
      end
      puts
      puts "[ with_clues ] HTML {"
      puts
      puts page.html
      puts
      puts "[ with_clues ] } END HTML"
      raise ex
    end
  end
end
