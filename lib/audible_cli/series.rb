class AudibleCli::Series
    attr_accessor :url, :title, :summary, :price
    @@all = []
    
    def initialize(title=nil, url=nil)
        @title = title
        @url = url
        @@all << self
    end

    # def self.new_series
    #     AudibleCli::Scraper.new_series.each_with_index do |series, index|
    #         puts "#{index}. #{series}"
    #         binding.pry
    #     end
    # end

    def self.all
        @@all
    end
end