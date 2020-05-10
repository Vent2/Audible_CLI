class AudibleCli::Series
    attr_accessor :url, :title, :summary, :price, :url_title
    @@all = []
    
    def initialize(title=nil, url=nil)
        @title = title
        @url = url
        @@all << self
    end

   def self.find_by_index(index)
    @@all[index]
   end


    def self.all
        @@all
    end
end