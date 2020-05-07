class AudibleCli::Scraper
    # series = []

    # series << self.scrape_audible
    def self.scrape_first_page
        doc = Nokogiri::HTML(open("https://www.audible.com/ep/series-science-fiction-fantasy-epic"))
        series_divs = doc.css('div.bc-box-padding-medium')
        # binding.pry
        #that will return an array of elements that are divs that house all of the info for each series 
        series_divs.each do |serie|
            new_series = AudibleCli::Series.new 
            new_series.title = serie.css('h3.bc-heading').text.strip
            new_series.bio = serie.css('.bc-text').children[1].text.delete('\u').strip #Adding â\u0080\u0099s figure how to remove
            new_series.url = serie.css('a.bc-link bc-color-link').attr('href')
            binding.pry
            
            #Go to audible, find the series
        end 
    end

    def second_series(series_obj)
            doc = Nokogiri::HTML(open(series_obj.url))
            series_obj.summary = doc.css('grab the summary here ')
            #series_obj.price = doc.css('grab price here')
    end
end

