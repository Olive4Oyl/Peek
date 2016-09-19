require 'nokogiri'
require 'httpclient'

class Giphy_Scraper
  ## squawk_box * displays what others are saying about company on reddit/investing
  def self.scrape(input)
    # front_page = Nokogiri::HTML(open("https://www.google.com/finance?q=apple&ei=X1bAV9mnBYjBesP3tsgM"))
       http = HTTPClient.new
       front_page = Nokogiri::HTML(http.get_content("http://giphy.com/gifs/horror-death-gallows-s4NAqcnB6UjJe"))

        posts = []
        front_page.css(".search-result").each do |post|
        header = post.css(".search-result-header").css("a").text
        expanded = post.css(".search-expando").css(".md").css("p").text
        posts << {reddit_header: header, expanded: expanded}
    end
      posts
  end

  def self.get_ticker_symbol(input)
    http = HTTPClient.new
    ticker = []
    ticker_lookup = Nokogiri::HTML(http.get_content("https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=microsoft+ticker"))

  end
end
