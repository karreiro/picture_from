module PictureFrom
  class TwitterPicture

    def initialize
      @twitter_crawler = Crawlers::TwitterCrawler.new
    end

    def picture_from_username(username)
      @twitter_crawler.image_url_by_username(username)
    end

  end
end
