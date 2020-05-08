class AudibleCli::Scraper
    # series = []

    # series << self.scrape_audible
    def self.scrape_first_page
        doc = Nokogiri::HTML(open("https://www.audible.com/ep/series-science-fiction-fantasy-epic"))
        rows_of_three_series = doc.css('.centerSlot')
        #these are rows of three
        #the first three or fours rows are garbage 
        # binding.pry
        #that will return an array of elements that are divs that house all of the info for each series 
        rows_of_three_series.each do |row|
            # binding.pry
            urls = row.css('a').map {|series_url_element| series_url_element.attr('href')}
            titles = row.css('h3').map {|series_title_element| series_title_element.text.strip}
            AudibleCli::Series.new(url: urls[0], title: titles[0])
            binding.pry
            #First 3 times are useless and returns nil after GameOfThrones,Lord,WheelOfTime
        end 
    end

    def second_series(series_obj)
            doc = Nokogiri::HTML(open(series_obj.url))
            series_obj.summary = doc.css('grab the summary here ')
            #series_obj.price = doc.css('grab price here')
    end
end

