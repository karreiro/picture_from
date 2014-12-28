module PictureFrom
  class FacebookPicture

    def initialize
      @facebook_crawler = Crawlers::FacebookCrawler.new
      @facebook_api = Apis::FacebookApi.new
    end

    def picture_from_username(username)
      @facebook_api.image_url_by_username(username)
    end

    def picture_from_user_info(user_info)
      username = @facebook_crawler.image_url_by_user_info(user_info)
      picture_from_username(username)
    end

  end
end
