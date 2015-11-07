require 'open-uri'

module PictureFrom
  module HTTP
    class Request
      def open_url(url)
        open URI.escape(url)
      rescue OpenURI::HTTPError
        # handle 404 and 400
        nil
      rescue RuntimeError
        # handle 302
        url
      end
    end
  end
end
