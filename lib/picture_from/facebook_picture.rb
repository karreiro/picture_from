module PictureFrom
  class FacebookPicture

    def initialize
      @facebook_crawler = Crawlers::FacebookCrawler.new
    end

    def picture_from_username(username)
      "http://graph.facebook.com/#{username}/picture"
    end

    def picture_from_user_info(user_info)
      username = @facebook_crawler.query(user_info)
      picture_from_username(username)
    end

  end
end
