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
    #ctrl D and ctrl-shift-L to select all the same words to change at once
    def self.second_series(series_obj)
            doc = Nokogiri::HTML(open(series_obj.url))
            series_obj.title = doc.css('h1.bc-heading').text.strip
            series_obj.summary = doc.css('div.bc-box.bc-box-padding-none.bc-spacing-small').text.strip
            #figure how to remove all the \u and \n
            series_obj.price = doc.css('span.bc-text.bc-size-base.bc-color-base')[1].text.strip
            # binding.pry

    end
end

