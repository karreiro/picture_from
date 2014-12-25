require 'open-uri'
require 'nokogiri'

module PictureFrom
  module Crawlers
    class BaseCrawler

      class Page
        def open_url(url)
          uri = URI.escape(url)
          Nokogiri::HTML open(uri)
        rescue OpenURI::HTTPError
          nil
        end
      end

    end
  end
end
