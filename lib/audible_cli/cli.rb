class AudibleCli::CLI

    def call
        list_series
        menu
        goodbye
    end

    def list_series
        puts <<-DOC.gsub /^\s*/, '' 
        Ready to read a great book?
        Here are a couple of series to get you started:
        DOC
        puts <<-DOC.gsub /^\s*/, '' 
          1.Kingkiller Chronicle
          2.Stormlight Archive
          3.A Song of Ice and Fire
        DOC
    
    end

    def menu
        input = nil
      while input != "exit"
        puts "Enter the number of the series you want to know more about or type list to see the series again or type exit:"
        input = gets.strip.downcase
        case input
        when "1"
            puts "More info on series 1..."
        when "2"
            puts "More info on series 2..."
        when "list"
            list_series
        else 
          puts "Not sure what you want, type list or exit:"
        end
      end
    end

    def goodbye
        puts <<-DOC.gsub /^\s*/, '' 
        Hope you found a book you're interested in.
        Happy reading!
        DOC
    end
end