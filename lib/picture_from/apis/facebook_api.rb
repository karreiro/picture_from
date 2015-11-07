require 'nokogiri'

module PictureFrom
  module Apis
    class FacebookApi

      # TODO: Use the http://graph.facebook.com/karreiro/picture?redirect=false
      # API to identify silhouette pictures.
      def image_url_by_username(username)
        request = HTTP::Request.new
        request.open_url("http://graph.facebook.com/#{username}/picture")
      end

    end
  end
end
