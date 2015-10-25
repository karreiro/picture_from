require 'picture_from/crawlers/base_crawler'
require 'picture_from/crawlers/facebook_crawler'
require 'picture_from/crawlers/twitter_crawler'
require 'picture_from/crawlers/gravatar_crawler'
require 'picture_from/apis/facebook_api'
require 'picture_from/facebook_picture'
require 'picture_from/gravatar_picture'
require 'picture_from/twitter_picture'
require 'picture_from/search_engine'
require 'picture_from/keyword'

module PictureFrom

  def self.url(keyword_value)
    search_engine = SearchEngine.new(keyword_value)
    search_engine.image_url
  end

end
