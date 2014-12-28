require 'open-uri'
require 'nokogiri'

module PictureFrom
  module Apis
    class FacebookApi

      # TODO: Use the http://graph.facebook.com/karreiro/picture?redirect=false
      # API to identify silhouette pictures.
      def image_url_by_username(username)
        url = "http://graph.facebook.com/#{username}/picture"
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
