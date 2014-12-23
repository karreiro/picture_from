require 'open-uri'
require 'nokogiri'

module PictureFrom
  module Crawlers
    class FacebookCrawler

      def query(keyword)
        page = search_page(keyword)
        results = page.css('#pagelet_search_results .instant_search_title a')
        username_from_url(results.first['href']) if results.size > 0
      end

      private

      def search_page(query)
        search_page_url = "https://www.facebook.com/search.php?q=#{query}"
        Nokogiri::HTML open(search_page_url)
      end

      def username_from_url(url)
        url_regex = %r{^https?://(www\.)?facebook.com/(?<username>[^/\.]*)}
        match = url_regex.match(url)
        match[:username] if match
      end

    end
  end
end
