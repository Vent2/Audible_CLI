class AudibleCli::CLI

    def call
      AudibleCli::Scraper.scrape_first_page
      list_series
      new_series
      menu
      goodbye
    end

    #/////////////////////////////////////////////////////
    #First menu gives you the series in numbered order
    #You then choose a series by typing in number
    #second Menu gives you a seummary of the series and the price of the first book
    #[Bonus] add url incase the user wants to go to audible.com and purchase the book
    #/////////////////////////////////////////////////////
    
    #def grab_first_page
    #end

    def grab_second_page_url
      AudibleCli::Series.all.each do |series|
      # binding.pry
      AudibleCli::Scraper.second_series(series)
      # binding.pry
      end
    end

    def list_series
        puts <<-DOC.gsub /^\s*/, '' 
        Ready to read a great book?
        Here are a couple of series to get you started:
        DOC
    end

        def new_series
          AudibleCli::Series.all.each_with_index do |series, i|
        # @series.each.with_index(1) do |series, i|
         puts "#{i}. #{series.title}"
          end
        end


    def menu
        input = nil
      while input != "exit"
        puts "Enter the number of the series you want to know more about or type list to see the series again or type exit:"
        input = gets.strip.downcase
        
        if input.to_i > 0 && input.to_i <19 #maybe 18
            the_series = @series[input.to_i-1]
            puts "#{the_series.title} - #{the_series.url}" #How to go to second scrape
        elsif input == "list"                              #Then add summary,price and maybe also add url to actual link 
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
  # end 
end