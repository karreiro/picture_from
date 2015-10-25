module PictureFrom
  module Crawlers
    class GravatarCrawler

      def picture_from_email(username)
        page = UserImage.new(username)
        page.avatar_image
      end
      class UserImage < BaseCrawler::Page
        def initialize(email)
          @url = "http://www.gravatar.com/avatar/#{digest(email)}?d=404"
          @image = open_url(@url)
        end

        def avatar_image
          @url if @image
        end

        private

        def digest(email)
          Digest::MD5.hexdigest(email)
        end
      end
    end
  end
end
