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
          @request = HTTP::Request.new
          @url = "http://www.gravatar.com/avatar/#{digest(email)}?d=404"
          @image = @request.open_url(@url)
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
