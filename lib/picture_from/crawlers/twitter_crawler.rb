module PictureFrom
  module Crawlers
    class TwitterCrawler

      def image_url_by_username(username)
        page = ProfilePage.new(username)
        page.avatar_image
      end

      class ProfilePage < BaseCrawler::Page
        def initialize(username)
          @page = open_url("https://twitter.com/#{username}")
        end

        def avatar_image
          @page.css('.ProfileAvatar-image').first['src'] if @page
        end
      end

    end
  end
end
