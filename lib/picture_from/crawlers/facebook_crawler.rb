module PictureFrom
  module Crawlers
    class FacebookCrawler

      def image_url_by_user_info(user_info)
        page = SearchPage.new(user_info)
        page.usernames.first
      end

      class SearchPage < BaseCrawler::Page
        def initialize(user_info)
          @page = open_url("https://www.facebook.com/search.php?q=#{user_info}")
        end

        def usernames
          results.map { |result| username_from_url(result['href']) }.compact
        end

        private

        def username_from_url(url)
          match = %r{^https?://(www\.)?facebook.com/(?<u>[^/\.]*)/?$}.match(url)
          match[:u] if match
        end

        def results
          @page.css('#pagelet_search_results .instant_search_title a')
        end
      end

    end
  end
end
