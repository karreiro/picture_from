require 'open-uri'

module PictureFrom
  module Apis
    class GravatarApi

      def picture_from_email(username)
        page = UserImage.new(username)
        page.avatar_image
      end
      class UserImage
        def initialize(email)
          @url = "http://www.gravatar.com/avatar/#{digest(email)}?d=404"
          @image = open_url
        end

        def open_url
          uri = URI.escape(@url)
          Nokogiri::HTML open(uri)
        rescue OpenURI::HTTPError
          nil
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
