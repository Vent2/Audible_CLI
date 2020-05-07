class AudibleCli::CLI

    def call
        AudibleCli::Scraper.scrape_first_page
        list_series
        menu
        goodbye
    end

    def list_series
        puts <<-DOC.gsub /^\s*/, '' 
        Ready to read a great book?
        Here are a couple of series to get you started:
        DOC

        @series = AudibleCli::Series.initialize
        @series.each.with_index(1) do |series, i|
          puts "#{i}. #{series.title} - #{series.bio} - #{series.url} "
        end
    end

    def menu
        input = nil
      while input != "exit"
        puts "Enter the number of the series you want to know more about or type list to see the series again or type exit:"
        input = gets.strip.downcase
        
        if input.to_i > 0
            the_serie = @series[input.to_i-1]
            puts "#{the_serie.title}- #{the_serie.bio} - #{the_serie.url}"
        elsif input == "list"
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