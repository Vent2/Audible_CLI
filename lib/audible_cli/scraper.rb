class AudibleCli::Scraper
    # series = []

    # series << self.scrape_audible
    def self.scrape_first_page
        doc = Nokogiri::HTML(open("https://www.audible.com/ep/series-science-fiction-fantasy-epic"))
        rows_of_three_series = doc.css('.centerSlot')
        #that will return an array of elements that are divs that house all of the info for each series 
        rows_of_three_series[3..].each do |row|
            urls = row.css('a').map {|series_url_element| series_url_element.attr('href')}
            titles = row.css('h3').map {|series_title_element| series_title_element.text.strip}
            if titles[0] != nil
            new_series = AudibleCli::Series.new(url = "https://www.audible.com#{urls[0]}", title = titles[0])
            end
            # binding.pry
            #First 3 times are useless and returns nil
        end 
    end

    def self.second_series(series_obj)
            doc = Nokogiri::HTML(open(series_obj.url))
            binding.pry
            # series_obj.summary = doc.css('grab the summary here ')
            # series_obj.price = doc.css('grab price here')
    end
end

