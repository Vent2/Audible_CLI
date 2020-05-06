class AudibleCli::Series
    attr_accessor :name, :author, :summary, :url
    def self.today
    #should return a bunch of instances of series
    puts <<-DOC.gsub /^\s*/, '' 
        Ready to read a great book?
        Here are a couple of series to get you started:
        1.Kingkiller Chronicle
        2.Stormlight Archive
        3.A Song of Ice and Fire
    DOC

        series_1 = self.new
        series_1.name = "KingKiller Chronicle"
        series_1.author = "Patrick Rothfuss"
        series_1.summary = "The story of a young, determined hero's search for meaning in the universe"
        series_1.url = "https://www.audible.com/series/KingKiller-Chronicles-Audiobooks/B005NATG0M?ref=a_ep_series_c4_collection_card_mosaic_0&pf_rd_p=caca97a5-e24f-44e6-ad1f-207452d76776&pf_rd_r=7KVCVWK8JNS9PPFZPY82"
        
        
        series_2 = self.new
        series_2.name = "Stormlight Archive"
        series_2.author = "Brandon Sanderson"
        series_2.summary = "Wartorn world, where 1- armies with mystical weapons battle a single for and seek answers in an anciet text"
        series_2.url = "https://www.audible.com/series/Stormlight-Archive-Audiobooks/B006K1RP8I?ref=a_ep_series_c4_collection_card_mosaic_1&pf_rd_p=caca97a5-e24f-44e6-ad1f-207452d76776&pf_rd_r=7KVCVWK8JNS9PPFZPY82"
        
        [series_1, series_2]
    end
end