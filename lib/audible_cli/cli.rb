class AudibleCli::CLI

    def call
      waiting_message
      AudibleCli::Scraper.scrape_first_page
      intro
      new_series
      menu
      goodbye
    end

    #/////////////////////////////////////////////////////
    #First menu gives you the series in numbered order
    #You then choose a series by typing in number
    #second Menu gives you a summary of the series and the price of the first book
    #/////////////////////////////////////////////////////
    

    def waiting_message
      puts "One moment while I scrape..."
    end

    def intro
        
        puts <<-DOC.gsub /^\s*/, '' 
        ██████╗░███████╗░█████╗░██████╗░██╗░░░██╗  ████████╗░█████╗░  ██████╗░███████╗░█████╗░██████╗░  ░█████╗░
        ██╔══██╗██╔════╝██╔══██╗██╔══██╗╚██╗░██╔╝  ╚══██╔══╝██╔══██╗  ██╔══██╗██╔════╝██╔══██╗██╔══██╗  ██╔══██╗
        ██████╔╝█████╗░░███████║██║░░██║░╚████╔╝░  ░░░██║░░░██║░░██║  ██████╔╝█████╗░░███████║██║░░██║  ███████║
        ██╔══██╗██╔══╝░░██╔══██║██║░░██║░░╚██╔╝░░  ░░░██║░░░██║░░██║  ██╔══██╗██╔══╝░░██╔══██║██║░░██║  ██╔══██║
        ██║░░██║███████╗██║░░██║██████╔╝░░░██║░░░  ░░░██║░░░╚█████╔╝  ██║░░██║███████╗██║░░██║██████╔╝  ██║░░██║
        ╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝╚═════╝░░░░╚═╝░░░  ░░░╚═╝░░░░╚════╝░  ╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝╚═════╝░  ╚═╝░░╚═╝

        ░██████╗░██████╗░███████╗░█████╗░████████╗  ██████╗░░█████╗░░█████╗░██╗░░██╗░█████╗░
        ██╔════╝░██╔══██╗██╔════╝██╔══██╗╚══██╔══╝  ██╔══██╗██╔══██╗██╔══██╗██║░██╔╝██╔══██╗
        ██║░░██╗░██████╔╝█████╗░░███████║░░░██║░░░  ██████╦╝██║░░██║██║░░██║█████═╝░╚═╝███╔╝
        ██║░░╚██╗██╔══██╗██╔══╝░░██╔══██║░░░██║░░░  ██╔══██╗██║░░██║██║░░██║██╔═██╗░░░░╚══╝░
        ╚██████╔╝██║░░██║███████╗██║░░██║░░░██║░░░  ██████╦╝╚█████╔╝╚█████╔╝██║░╚██╗░░░██╗░░
        ░╚═════╝░╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝░░░╚═╝░░░  ╚═════╝░░╚════╝░░╚════╝░╚═╝░░╚═╝░░░╚═╝░░

        Here is a couple of series to get you started:
        DOC
    end

        def new_series
          AudibleCli::Series.all.sort_by{|series| series.title}.each_with_index do |series, i|
            puts "#{i+1}. #{series.title}"
          end
          
        end

    def menu
        input = nil
      while input != "exit"
        puts "Enter the number of the series you want to know more about or type list or exit:"
        input = gets.strip.downcase
        system("clear")
        
        if input.to_i > 0 && input.to_i <= AudibleCli::Series.all.length
          the_series = AudibleCli::Series.find_by_index(input.to_i-1)
            puts "#{the_series.url_title}"
            puts ""
            puts "#{the_series.summary}"
            puts ""
            puts "You could get the first book in this series for #{the_series.price}"
            puts "Or if you would like to check it out without investing to much money to begin with you can try the 30 day free trail."
            puts ""
            puts "Why don't you check it out!(#{the_series.url})"
        elsif input == "list"
            new_series
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