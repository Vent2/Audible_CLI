class AudibleCli::Scraper
    series = []

    # series << self.scrape_audible
    def self.scrape_first_page
        doc = Nokogiri::HTML(open("https://www.audible.com/ep/series-science-fiction-fantasy-epic"))
        series_divs = doc.css('put there classes that all the series divs have in common')
        binding.pry
        #that will return an array of elements that are divs that house all of the info for each series 
        series_divs.each do |series_div|
            series = AudibleCli::Series.new 
            series.title = series_div.css('')
            #series.description = 
            #series.url = 
            #Go to audible, find the series
        end 
    end

    def second_series(series_obj)
            doc = Nokogiri::HTML(open(series_obj.url))
            series_obj.summary = doc.css('grab the summary here ')
            #series_obj.price = doc.css('grab price here')
    end
end

# Scraper.scrape_first_page