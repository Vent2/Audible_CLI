class AudibleCli::Scraper

    def self.scrape_first_page
        doc = Nokogiri::HTML(open("https://www.audible.com/ep/series-science-fiction-fantasy-epic"))
        rows_of_three_series = doc.css('.centerSlot')
        #that will return an array of elements that are divs that house all of the info for each series 
        rows_of_three_series[3..].each do |row|
            titles = row.css('h3').map {|series_title_element| series_title_element.text.strip}
            urls = row.css('a').map {|series_url_element| series_url_element.attr('href')}
            if titles[0] != nil
            new_series = AudibleCli::Series.new(title = titles[0], url = "https://www.audible.com#{urls[0]}")
            second_series(new_series)
            end
            #First 3 times are useless and returns nil
        end 
    end

    def self.second_series(new_series)
            doc = Nokogiri::HTML(open(new_series.url))
            doc.css('div.adbl-main').each do |series|
            new_series.url_title = series.css('h1.bc-heading').text.strip
            new_series.summary = series.css('div.bc-box.bc-box-padding-none.bc-spacing-small').text.strip.gsub("Â","").gsub("'", "").gsub("â", "")
            new_series.price = series.css('span.bc-text.bc-size-base.bc-color-base')[1].text.strip
            end
    end
end

